<cfset badgeNum = FORM.badge_number>

<cfquery datasource="magsuite" name="checkBadge">
	SELECT atn.atn_id AS id,
				 atn.atn_name AS name,
				 atn.atn_dh AS head,
				 atn.atn_eligible AS isEligible,
				 atn.get_delivery,
				 rst.vegetarian,
				 rst.vegan,
				 rst.pork,
				 rst.gluten,
				 rst.dairy,
				 rst.cheese,
				 rst.rst_notes AS notes,
				 typ.typ_name AS type
		FROM attendees atn,
				 restrictions rst,
				 type typ
	 WHERE atn.atn_id = rst.atn_id
		 AND atn.typ_id = typ.typ_id
		 AND atn.atn_badgenum = <cfqueryparam cfsqltype="cf_sql_integer" value="#badgeNum#">
</cfquery>

<cfif checkBadge.recordCount EQ 0 or (checkBadge.recordCount EQ 1 AND checkBadge.isEligible EQ 0)>
	<h2 class="text-center text-danger"><strong>Sorry!</strong></h2>
	<p class="lead text-center">You are not eligible to receive food at this time. Please bring your signed hours sheet to Staffing Operations in Chesapeake DEF to have your hours verified.</p>
<cfelseif checkBadge.recordCount EQ 1 AND checkBadge.get_delivery EQ 0>
	<h2 class="text-center text-danger"><strong>Sorry!</strong></h2>
	<p class="lead text-center">You are not eligible to receive food delivery. Please visit Room 6176 to receive food.</p>
<cfelseif checkBadge.recordCount EQ 1>
	<cfoutput>
	<h2 class="text-center text-success">
		<strong>#checkBadge.name#</strong><br>
		<small>#checkBadge.type# ###badgeNum# <cfif checkBadge.head>(Department Head)</cfif><cfif checkBadge.type NEQ "Staff" and checkBadge.type NEQ "Guest">(Volunteer)</cfif></small>
	</h2>
	
	<p class="lead text-center text-<cfif checkBadge.vegetarian>success<cfelse>danger</cfif>">
		<span class="fa fa-<cfif checkBadge.vegetarian>check<cfelse>times</cfif>"></span> Vegetarian
	</p>
	<p class="lead text-center text-<cfif checkBadge.vegan>success<cfelse>danger</cfif>">
		<span class="fa fa-<cfif checkBadge.vegan>check<cfelse>times</cfif>"></span> Vegan
	</p>
	<p class="lead text-center text-<cfif checkBadge.pork or checkBadge.vegan or checkBadge.vegetarian>success<cfelse>danger</cfif>">
		<span class="fa fa-<cfif checkBadge.pork or checkBadge.vegan or checkBadge.vegetarian>check<cfelse>times</cfif>"></span> Pork
	</p>
	<p class="lead text-center text-<cfif checkBadge.gluten>success<cfelse>danger</cfif>">
		<span class="fa fa-<cfif checkBadge.gluten>check<cfelse>times</cfif>"></span> Gluten
	</p>
	<p class="lead text-center text-<cfif checkBadge.dairy or checkBadge.vegan>success<cfelse>danger</cfif>">
		<span class="fa fa-<cfif checkBadge.dairy or checkBadge.vegan>check<cfelse>times</cfif>"></span> Dairy
	</p>
	<p class="lead text-center text-<cfif checkBadge.cheese or checkBadge.vegan>success<cfelse>danger</cfif>">
		<span class="fa fa-<cfif checkBadge.cheese or checkBadge.vegan>check<cfelse>times</cfif>"></span> Cheese
	</p>
	<p class="lead col-sm-6 col-sm-offset-3 text-center">
		Food restriction notes you left for Staff Suite:<br>
		<small><em><cfif checkBadge.notes EQ ''>none<cfelse>#checkBadge.notes#</cfif></em></small>
	</p>
	
	<p class="col-sm-6 col-sm-offset-3 text-center">
		By clicking below I have verified that I am the person listed above and the information displayed are the food restrictions I entered.
	</p>
	
	<div class="col-sm-6 col-sm-offset-3" style="margin-top:15px; margin-bottom:25px;">
		<input type="hidden" name="atnID" id="atnID" value="#checkBadge.id#">
		<!---<cfif checkBadge.head>
			<div class="col-xs-6">
				<button type="submit" name="verified" id="verified" value="group" class="btn btn-lg btn-block btn-warning">Group Order</button>
			</div>
			<div class="col-xs-6">
		<cfelse>--->
		<div class="col-xs-12">
	<!---</cfif>--->
			<button type="submit" name="verified" id="verified" value="individual" class="btn btn-lg btn-block btn-primary">Individual Order</button>
		</div>
	</div>
	
	<p class="col-sm-6 col-sm-offset-3 text-center small">
		<a href="#buildUrl('delivery')#">This is not my information</a><Br><br>
		<em>If the above information is incorrect, please contact the <a href="mailto:jennifer.truss@gmail.com">Staff Suite</a>.
	</p>
	</cfoutput>
<cfelse>
	<cflocation addtoken="no" url="#buildUrl('main.error')#">
</cfif>