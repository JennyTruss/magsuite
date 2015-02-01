<cfset request.layout = false />

<cfcontent type="application/msexcel"/> 
<cfheader name="content-disposition" value="attachment; filename=#URL.meal# Delivery Labels.xls">
<!--- 
mso-page-orientation:landscape causes the exported excel spreadsheet to be printed landscape.
Setting Scale=45 causes the printout to fit to page width for me.
Per the documentation, I should be able to set
<x:Print><x:FitWidth>1</x:FitWidth><x:FitHeight>32767</x:FitHeight><x:ValidPrinterInfo/></x:Print>
but it doesn't want to work.
The width and height appear correctly in the Page Setup dialog, but the 'Adjust to' scale size
radio button remains selected instead of the 'Fit to' one page wide by 32767 tall radio button.
--->

<cfquery datasource="magsuite" name="getDeliveries">
		SELECT atn.atn_badgenum AS badge,
					 atn.atn_name AS name,
					 atn.atn_id AS atnID,
					 dpt.dpt_name AS department,
					 dpt.dpt_location AS location,
					 rst.gluten,
					 rst.dairy,
					 rst.cheese,
					 rst.pork,
					 rst.vegan,
					 rst.vegetarian,
					 del.del_id AS ID,
					 del.del_comment AS notes,
					 del.del_food AS food
			FROM delivery del,
					 attendees atn,
					 restrictions rst,
					 meals mel,
					 department dpt
		 WHERE del.atn_id = atn.atn_id
			 AND del.atn_id = rst.atn_id
			 AND del.mel_id = mel.mel_id
			 AND del.dpt_id = dpt.dpt_id
			 AND mel.mel_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#URL.meal#">
	ORDER BY dpt.dpt_name ASC, atn.atn_badgenum ASC
</cfquery>

<cfoutput>
	<table>
		<tr>
			<td>Department</td>
			<td>Location</td>
			<td>Badge Number</td>
			<td>Name</td>
			<td>Meal</td>
			<td>Notes</td>
			<td>Restrictions</td>
		</tr>
		<cfloop query="getDeliveries">
		<cfset myFood = ReplaceNoCase(getDeliveries.food, '|', ', ', 'all')>
		<cfset myFood = reReplace(lCase(myFood),'\b([a-z])','\U\1','all')>
		<cfset restrictions = ''>
		<cfif vegan><cfset restrictions = ListAppend(restrictions,'vegan')></cfif>
		<cfif vegetarian><cfset restrictions = ListAppend(restrictions,'vegetarian')></cfif>
		<cfif NOT gluten><cfset restrictions = ListAppend(restrictions,'gluten free')></cfif>
		<cfif NOT pork><cfset restrictions = ListAppend(restrictions,'no pork')></cfif>
		<cfif NOT dairy><cfset restrictions = ListAppend(restrictions,'no dairy')></cfif>
		<cfif NOT cheese><cfset restrictions = ListAppend(restrictions,'no cheese')></cfif>

		<tr>
			<td>#UCase(department)#</td>
			<td>#location#</td>
			<td>#badge#</td>
			<td>#name#</td>
			<td>#myFood#</td>
			<td>#notes#</td>
			<td class="text-uppercase">#UCase(Replace(restrictions,',',' - ','all'))#</td>
		</tr>
		</cfloop>
	</table>
</cfoutput>

