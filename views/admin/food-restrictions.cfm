<cfset rc.title = "Food Restrictions" />	<!--- set a variable to be used in a layout --->


<cfoutput>

<cfquery datasource="magsuite" name="getRestrictions">
	SELECT atn.atn_id, 
		atn.atn_eligible AS eligible, 
		typ.typ_name AS type, 
		rst.dairy, 
		rst.gluten, 
		rst.pork, 
		rst.vegan, 
		rst.vegetarian, 
		rst.rst_notes AS notes
	FROM restrictions rst, 
		attendees atn, 
		type typ
	WHERE rst.atn_id = atn.atn_id
	AND atn.typ_id = typ.typ_id
	ORDER BY atn.atn_id
</cfquery>


<cfset noDairy = getRestrictions.recordCount>
<cfset noGluten = getRestrictions.recordCount>
<cfset noPork = getRestrictions.recordCount>
<cfset isVegan = 0>
<cfset isVegetarian = 0>
<cfset staff = 0>
<cfset guest = 0>
<cfset elgVolunteer = 0>
<cfset inelgVolunteer = 0>
<cfset comments = ''>


<cfloop query="#getRestrictions#">

	<cfif dairy>
		<cfset noDairy-->
	</cfif>
	
	<cfif gluten>
		<cfset noGluten-->
	</cfif>
	
	<cfif pork>
		<cfset noPork-->
	</cfif>
	
	<cfif vegan>
		<cfset isVegan++>
	</cfif>
	
	<cfif vegetarian>
		<cfset isVegetarian++>
	</cfif>
	
	<cfswitch expression="#type#">
		<cfcase value="Staff">
			<cfset staff++>
		</cfcase>
		
		<cfcase value="Guest">
			<cfset guest++>
		</cfcase>
		
		<cfdefaultcase>
			<cfif eligible>
				<cfset elgVolunteer++>
			<cfelse>
				<cfset inelgVolunteer++>
			</cfif>
		</cfdefaultcase>
	</cfswitch>
	
	<cfif notes NEQ ''>
		<cfset comments &= '<li>' & notes & '</li>'>
	</cfif>

</cfloop>

<cfif isDefined('FORM.updateNumbers')>
	<cfquery datasource="magsuite">
		INSERT INTO numbers (staff,guests,elg_volunteers,inelg_volunteers,no_dairy,no_gluten,no_pork,vegan,vegetarian)
		VALUES (
			<cfqueryparam cfsqltype="cf_sql_integer" value="#staff#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#guest#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#elgVolunteer#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#inelgVolunteer#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#noDairy#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#noGluten#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#noPork#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#isVegan#">,
			<cfqueryparam cfsqltype="cf_sql_integer" value="#isVegetarian#">
		)
	</cfquery>
</cfif>

<div class="text-right">
	<form name="numbers" id="numbers" method="post" action="#buildUrl('admin.food-restrictions')#">
		<button type="submit" name="updateNumbers" id="updateNumbers" class="btn btn-xs btn-warning">Update Numbers</button>
	</form>
</div>

<h1>Food Restriction Information</h1>

<div class="row">
	<div class="col-sm-3 text-center">
		<p class="lead text-primary"><strong>Total eligible:</strong> #staff+guest+elgVolunteer#</p>
		<p class="small">Total in System: #getRestrictions.recordCount#</p>
	</div>
	<div class="col-sm-3 text-center">
		<p class="text-success"><strong>Staff:</strong> #staff#</p>
	</div>
	<div class="col-sm-3 text-center">
		<p class="text-warning"><strong>Guests:</strong> #guest#</p>
	</div>
	<div class="col-sm-3 text-center">
		<p class="text-danger"><strong>Total Volunteers:</strong> #elgVolunteer+inelgVolunteer#</p>
		<p class="small">Eligible Volunteers: #elgVolunteer#<Br>
		Still needs hours: #inelgVolunteer#</p>
	</div>
</div>

<hr>

<div class="clearfix">
	<ul class="nav nav-justified">
		<li class="text-center"><strong>No Dairy:</strong> #noDairy#</li>
		<li class="text-center"><strong>No Gluten:</strong> #noGluten#</li>
		<li class="text-center"><strong>No Pork:</strong> #noPork#</li>
		<li class="text-center"><strong>Vegan:</strong> #isVegan#</li>
		<li class="text-center"><strong>Vegetarian:</strong> #isVegetarian#</li>
	</ul>
</div>

<hr>

<div class="row">
	<h2>Notes:</h2> 
	<ul>#comments#</ul>
</div>


</cfoutput>