<cfset rc.title = "Admin Dashboard" />	<!--- set a variable to be used in a layout --->


<cfif isDefined('FORM.setMeal') AND FORM.setMeal EQ 'Start'>

	<cfquery datasource="magsuite">
		UPDATE meals
		SET enabled = 1
		WHERE mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.mealID#">
	</cfquery>

<cfelseif isDefined('FORM.setMeal') AND FORM.setMeal EQ 'END'>
	
	<cfquery datasource="magsuite">
		UPDATE meals
		SET enabled = 0
		WHERE mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.mealID#">
	</cfquery>
	
</cfif>

<cfset thisTime = now()>
<cfquery datasource="magsuite" name="getMeal">
	SELECT mel_id, mel_name, mel_end
	FROM meals
	WHERE enabled = 1
</cfquery>

<cfif getMeal.recordCount GT 0>
	<cfset btnStatus = 'danger'>
	<cfset btnMsg = 'End'>
	<cfset thisMeal = getMeal.mel_name>
	<cfset mealID = getMeal.mel_id>
	<cfset mealTime = TimeFormat(getMeal.mel_end, 'short')>
<cfelse>
	<cfquery datasource="magsuite" name="nextMeal">
		SELECT mel_id, mel_name, mel_start
		FROM meals
		ORDER BY mel_start ASC
	</cfquery>
	
	<cfloop query="nextMeal">
		<cfif DateCompare(thisTime, mel_start) LTE 0>
			<cfset btnStatus = 'success'>
			<cfset btnMsg = 'Start'>
			<cfset thisMeal = mel_name>
			<cfset mealID = mel_id>
			<cfset mealTime = TimeFormat(mel_start, 'short')>
			<cfbreak>
		</cfif>
	</cfloop>
</cfif>

<cfoutput>

<!---<form name="mealStatus" id="mealStatus" method="post" action="#buildUrl('admin')#">
	<input type="hidden" name="mealID" id="mealID" value="#mealID#">
	<p class="lead">
		<cfif btnMsg EQ 'End'>
			Currently serving #thisMeal#. Scheduled end time is #mealTime#.
		<cfelse>
			The next meal, #thisMeal#, is scheduled to begin at #mealTime#.
		</cfif>
		&emsp;
		<button type="submit" name="setMeal" id="setMeal" class="btn btn-lg btn-bigger btn-#btnStatus#" value="#btnMsg#">
			#btnMsg# Meal
		</button>
	</p>
</form>--->

</cfoutput>


<h1 class="h3">Meal Counts</h1>

<cfquery datasource="magsuite" name="meals">
	SELECT mel_id, mel_name, mel_start
	FROM meals
	ORDER BY mel_start
</cfquery>

<cfloop query="meals">
	<cfset totalMeals = 0>
	<cfquery datasource="magsuite" name="counts">
		SELECT bdg_id
		FROM badges
		WHERE mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#mel_id#">
	</cfquery>
	<cfset totalMeals = totalMeals + counts.recordCount>
	<cfquery datasource="magsuite" name="delcounts">
		SELECT del_id
		FROM delivery
		WHERE mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#mel_id#">
	</cfquery>
	<cfset totalMeals = totalMeals + delcounts.recordCount>
	<cfoutput><p class="lead"><strong>#mel_name#:</strong> #totalMeals#</p></cfoutput>
</cfloop>

<cfquery datasource="magsuite" name="departments">
	SELECT dpt_name, dpt_location
	FROM department
	ORDER BY dpt_name
</cfquery>

<cfoutput>
<table>
	<cfloop  query="departments">
		<tr>
			<td>#dpt_name#</td>
			<td>#dpt_location#</td>
		</tr>
	</cfloop>
</table>
</cfoutput>