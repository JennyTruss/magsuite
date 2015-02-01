<cfset rc.title = "Delivery Information" />	<!--- set a variable to be used in a layout --->
<cfoutput><h1>#rc.title#</h1></cfoutput>


<cfset mealList = "Friday Lunch,Friday Dinner,Saturday Lunch,Saturday Dinner,Sunday Lunch,Sunday Dinner">

<div class="row">
<form name="delSummary" id="delSummary" method="post" action="<cfoutput>#buildUrl('admin.get-delivery')#</cfoutput>">
	<cfloop list="#mealList#" index="thisMeal">
		<cfquery datasource="magsuite" name="delCounts">
			SELECT del.del_id
			FROM delivery del, meals mel
			WHERE del.mel_id = mel.mel_id
			AND mel.mel_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#thisMeal#">
		</cfquery>
		
		<cfoutput>
			<div class="col-md-2 col-sm-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h2 class="h4 text-center">#thisMeal#</h2>
					</div>
					<div class="panel-body">
						<p class="lead text-center">#delCounts.recordCount#</p>
						<p>
							<button type="submit" class="btn btn-primary btn-block" name="deliveryList" id="deliveryList" value="#thisMeal#">
								Delivery List
							</button>
						</p>
						<p>
							<button type="submit" class="btn btn-default btn-block" name="deliveryLabels" id="deliveryLabels" value="#thisMeal#">
								Print Labels
							</button>
						</p>
						<p>
							<button type="submit" class="btn btn-warning btn-block" name="foodTotals" id="foodTotals" value="#thisMeal#">
								Food Totals
							</button>
						</p>
					</div>
				</div>
			</div>
		</cfoutput>
	</cfloop>
</form>
</div>

<cfif isDefined('FORM.deliveryList') OR isDefined('FORM.deliverStatus')>

	<cfif isDefined('deliverStatus')>
		<cfquery datasource="magsuite">
			UPDATE delivery
			SET 
				<cfif FORM.deliverStatus EQ 'out'>
					out_delivery = 1
				<cfelseif FORM.deliverStatus EQ 'delivered'>
					delivered = 1
				</cfif>
			WHERE dpt_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.dptID#">
			AND mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.melID#">
		</cfquery>
	</cfif>

	<cfquery datasource="magsuite" name="delOverview">
		SELECT del.del_id AS ID,
			del.out_delivery,
			del.delivered,
			dpt.dpt_name AS department,
			dpt.dpt_id,
			atn.atn_badgenum AS badge,
			atn.atn_name AS name,
			mel.mel_id
		FROM delivery del,
			meals mel,
			department dpt,
			attendees atn
		WHERE del.mel_id = mel.mel_id
		AND del.dpt_id = dpt.dpt_id
		AND del.atn_id = atn.atn_id
		AND mel.mel_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.deliveryList#">
		ORDER BY dpt.dpt_name ASC, atn.atn_badgenum ASC
	</cfquery>
	
	<cfoutput query="delOverview" group="department">
		<hr>
		<h2>#department#</h2>
		<form name="setStatus" id="setStatus" method="post" action="#buildUrl('admin.get-delivery')#">
			<input type="hidden" name="dptID" id="dptID" value="#dpt_id#">
			<input type="hidden" name="deliveryList" id="deliveryList" value="#FORM.deliveryList#">
			<input type="hidden" name="melID" id="melID" value="#mel_id#">
			<p>
			<cfif NOT out_delivery>
				<button type="submit" class="btn btn-warning" name="deliverStatus" id="deliverStatus" value="out">
					Out for Delivery
				</button>
			<cfelseif NOT delivered>
				<span class="alert alert-warning"><strong>Out for Delivery</strong></span>&emsp;
				<button type="submit" class="btn btn-success" name="deliverStatus" id="deliverStatus" value="delivered">
					Delivered
				</button>
			<cfelse>
				<span class="alert alert-success"><strong>Delivered</strong></span>
			</cfif>
			</p>
		</form>
		
		<ul class="list-unstyled">
		<cfoutput>
			<li><strong>#badge#</strong> - #name#</li>
		</cfoutput>
		</ul>
		<hr>
	</cfoutput>

<cfelseif isDefined('FORM.deliveryLabels')>

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
				 AND mel.mel_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.deliveryLabels#">
		ORDER BY dpt.dpt_name ASC, atn.atn_badgenum ASC
	</cfquery>
	
	
	
	<cfoutput>
		<h2>#FORM.deliveryLabels#</h2>
		<p><a class="btn btn-primary" href="/admin/_excel_file?meal=#FORM.deliveryLabels#">Print Labels</a></p>
		<table class="table">
			<thead>
				<tr>
					<th>Department</th>
					<th>Location</th>
					<th>Badge Number</th>
					<th>Name</th>
					<th>Meal</th>
					<th>Notes</th>
					<th>Restrictions</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="getDeliveries">
				<cfset myFood = ReplaceNoCase(food, '|', ', ', 'all')>
				<cfset myFood = reReplace(lCase(myFood),'\b([a-z])','\U\1','all')>

				<cfset restrictions = ''>
				<cfif vegan><cfset restrictions = ListAppend(restrictions,'vegan')></cfif>
				<cfif vegetarian><cfset restrictions = ListAppend(restrictions,'vegetarian')></cfif>
				<cfif NOT gluten><cfset restrictions = ListAppend(restrictions,'gluten free')></cfif>
				<cfif NOT pork><cfset restrictions = ListAppend(restrictions,'no pork')></cfif>
				<cfif NOT dairy><cfset restrictions = ListAppend(restrictions,'no dairy')></cfif>
				<cfif NOT cheese><cfset restrictions = ListAppend(restrictions, 'no cheese')></cfif>
				<tr>
					<td>#department#</td>
					<td>#location#</td>
					<td>#badge#</td>
					<td>#name#</td>
					<td>#myFood#</td>
					<td>#notes#</td>
					<td class="text-uppercase">#UCase(Replace(restrictions,',',' - ','all'))#</td>
				</tr>
				</cfloop>
			</tbody>
		</table>
	</cfoutput>

<cfelseif isDefined('FORM.foodTotals')>
	
	<cfoutput><h2>Food amounts for #FORM.foodTotals#</h2></cfoutput>
	
	<cfquery datasource="magsuite" name="fTotals">
		SELECT del.del_food
		FROM delivery del,
			meals mel
		WHERE del.mel_id = mel.mel_id
		AND mel.mel_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.foodTotals#">
		ORDER BY del.del_food ASC
	</cfquery>
	
	<ul class="list-unstyled">
	<cfoutput query="fTotals" group="del_food">
		<cfset foodCount = 0>
		<cfset thisFood = del_food>
		<cfloop query="fTotals">
			<cfif del_food EQ thisFood>
				<cfset foodCount++>
			</cfif>
		</cfloop>
		<cfset thisFood = ReplaceNoCase(thisFood, '|', ', ', 'all')>
		<cfset thisFood = reReplace(lCase(thisFood),'\b([a-z])','\U\1','all')>		
		<li><strong>#foodCount#</strong> &mdash; #thisFood#</li>
	</cfoutput>
	</ul>
	
</cfif>




