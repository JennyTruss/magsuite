<cfsetting showdebugoutput="yes">

<cfset rc.title = "Update Eligible" />	<!--- set a variable to be used in a layout --->

<cfoutput>
<h1>#rc.title#</h1>
<p class="lead">Copy and paste Food Eligible XML from Uber to update the information on those that are food eligible in this system.</p>

<form name="enterXml" id="enterXml" action="#buildUrl('admin.update-eligible')#" method="post">
	<p><button type="submit" name="addXml" id="addXml" class="btn btn-lg btn-block btn-primary">Process</button></p>
	<p><textarea name="theXml" id="theXml" rows="25" class="form-control" placeholder="Paste in XML Data"></textarea></p>
</form>

<cfset updated = now()>

<cfset deptHeads = "548,541,149,86,85,84,83,82,81,80,79,78,77,75,74,73,72,71,70,69,68,67,66,65,64,63,661,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,35,33,32,31,30,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,6,5,4,3,2">

<cfif isDefined('FORM.addXml')>
	
	<cfset theXml = ReplaceNoCase(FORM.theXml,'<notes>','<notes><![CDATA[','all')>
	<cfset theXml = ReplaceNoCase(theXml,'</notes>',']]></notes>','all')>
	<cfset theXml = ReplaceNoCase(theXml,'This XML file does not appear to have any style information associated with it. The document tree is shown below.','','all')>
	<cfset theXml = ReplaceNoCase(theXml,'<?xml version="1.0" encoding="UTF-8"?>','','all')>
	<cfset theXml = ReplaceNoCase(theXml,'<attendees>','','all')>
	<cfset theXml = ReplaceNoCase(theXml,'</attendees>','','all')>
	<cfset theXml = "<attendees>" & theXml & "</attendees>">
	
	<cfset xmlData = XmlParse( theXml )>
	
	<cfset attendees = XmlSearch(xmlData,'attendees/attendee')>
	
	<cfset attendeeNames = ''>
	
	<cfloop array="#attendees#" index="attendee">
		
		<cfset data = {
			name='[UNKNOWN]',
			badge='00000',
			type='0',
			eligible='1',
			head='0',
			dairy='1',
			gluten='1',
			pork='1',
			vegan='0',
			vegetarian='0',
			cheese='1',
			notes=''
		}>
		
		<cfif isDefined('attendee.xmlAttributes.name')>
			<cfset data.name = attendee.xmlAttributes.name>
			<cfset attendeeNames = ListAppend(attendeeNames,data.name)>
		</cfif>
		
		<cfif isDefined('attendee.xmlAttributes.badge_number')>
			<cfset data.badge = attendee.xmlAttributes.badge_number>
			
			<cfif ListFind(#deptHeads#,data.badge) GT 0>
				<cfset data.head = 1>
			</cfif>
		</cfif>
		
		<cfif isDefined('attendee.xmlAttributes.badge_type')>
			<cfset thisType = attendee.xmlAttributes.badge_type>
			
			<cfif thisType EQ "Attendee" OR thisType EQ "Supporter">
				<cfif isDefined('attendee.xmlAttributes.now_eligible') AND attendee.xmlAttributes.now_eligible EQ "false">
					<cfset data.eligible = 0>
				</cfif>
			</cfif>
			
			<cfquery datasource="magsuite" name="badgeType">
				SELECT typ_id
				FROM type
				WHERE typ_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#thisType#">
			</cfquery>
			
			<cfset data.type = badgeType.typ_id>
		</cfif>
			
		<cfif isDefined('attendee.xmlAttributes.dairy') AND attendee.xmlAttributes.dairy>
			<cfset data.dairy = 0>
		</cfif>
		
		<cfif isDefined('attendee.xmlAttributes.gluten') AND attendee.xmlAttributes.gluten>
			<cfset data.gluten = 0>
		</cfif>
		
		<cfif isDefined('attendee.xmlAttributes.pork') AND attendee.xmlAttributes.pork>
			<cfset data.pork = 0>
		</cfif>
		
		<cfif isDefined('attendee.xmlAttributes.vegan') AND attendee.xmlAttributes.vegan>
			<cfset data.vegan = 1>
		</cfif>
		
		<cfif isDefined('attendee.xmlAttributes.vegetarian') AND attendee.xmlAttributes.vegetarian>
			<cfset data.vegetarian = 1>
		</cfif>
		
		<cfif isDefined('attendee.xmlAttributes.no_cheese') AND attendee.xmlAttributes.no_cheese>
			<cfset data.cheese = 0>
		</cfif>
		
		<cfif isDefined('attendee.notes')>
			<cfset data.notes = attendee.notes.xmlText>
		</cfif>
		
		<cfquery datasource="magsuite" name="checkPerson">
			SELECT *
			FROM attendees atn, restrictions rst
			WHERE atn.atn_id = rst.atn_id
			AND atn_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#data.name#">
		</cfquery>
		
		<cfif checkPerson.recordCount EQ 0>
		
			<cfquery datasource="magsuite">
				INSERT INTO attendees (atn_badgenum,atn_dh,atn_eligible,atn_name,typ_id,atn_created)
				VALUES (
					<cfqueryparam value="#data.badge#">,
					<cfqueryparam value="#data.head#">,
					<cfqueryparam value="#data.eligible#">,
					<cfqueryparam value="#data.name#">,
					<cfqueryparam value="#data.type#">,
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#updated#">
				)
			</cfquery>
			
			<cfquery datasource="magsuite" name="getID">
				SELECT atn_id
				FROM attendees
				WHERE atn_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#data.name#">
			</cfquery>
			
			<cfset newID = getID.atn_id>
			
			<cfif thisType eq 'Guest'>
				<cfquery datasource="magsuite">
					UPDATE attendees
					SET get_delivery = 0
					WHERE atn_id = <cfqueryparam value="#newID#">
				</cfquery>
			</cfif>
			
			<cfquery datasource="magsuite">
				INSERT INTO restrictions (atn_id,dairy,gluten,pork,rst_notes,vegan,vegetarian,cheese,rst_created)
				VALUES (
					<cfqueryparam value="#newID#">,
					<cfqueryparam value="#data.dairy#">,
					<cfqueryparam value="#data.gluten#">,
					<cfqueryparam value="#data.pork#">,
					<cfqueryparam value="#data.notes#">,
					<cfqueryparam value="#data.vegan#">,
					<cfqueryparam value="#data.vegetarian#">,
					<cfqueryparam value="#data.cheese#">,
					<cfqueryparam cfsqltype="cf_sql_timestamp" value="#updated#">
				)
			</cfquery>
		
		<cfelse>
			
			<cfset oldData = {
				name=checkPerson.atn_name,
				badge=checkPerson.atn_badgenum,
				type=checkPerson.typ_id,
				eligible=checkPerson.atn_eligible,
				head=checkPerson.atn_dh,
				dairy=checkPerson.dairy,
				gluten=checkPerson.gluten,
				pork=checkPerson.pork,
				vegan=checkPerson.vegan,
				vegetarian=checkPerson.vegetarian,
				cheese=checkPerson.cheese,
				notes=checkPerson.rst_notes
			}>
			
			<cfset same = oldData.EQUALS( data )>
			
			<cfif same EQ "NO">
				<cfquery datasource="magsuite">
					UPDATE attendees
					SET atn_updated = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#updated#">,
						atn_badgenum = <cfqueryparam value="#data.badge#">,
						typ_id = <cfqueryparam value="#data.type#">,
						atn_eligible = <cfqueryparam value="#data.eligible#">,
						atn_name = <cfqueryparam value="#data.name#">
					WHERE atn_id = #checkPerson.atn_id#
				</cfquery>
				
				<cfquery datasource="magsuite">
					UPDATE restrictions
					SET rst_updated = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#updated#">,
						dairy = <cfqueryparam value="#data.dairy#">,
						gluten = <cfqueryparam value="#data.gluten#">,
						pork = <cfqueryparam value="#data.pork#">,
						vegan = <cfqueryparam value="#data.vegan#">,
						vegetarian = <cfqueryparam value="#data.vegetarian#">,
						cheese = <cfqueryparam value="#data.cheese#">,
						rst_notes = <cfqueryparam value="#data.notes#">
					WHERE atn_id = #checkPerson.atn_id#
				</cfquery>
			</cfif>
					
		</cfif>
	</cfloop>

</cfif>

</cfoutput>