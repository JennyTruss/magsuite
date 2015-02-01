
<cfquery datasource="magsuite" name="mealInfo">
	SELECT *
	  FROM meals
	 WHERE mel_name LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%Lunch">
	    OR mel_name LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%Dinner">
	ORDER BY mel_start ASC
</cfquery>

<cfset nextMeal = 'Food delivery ordering is not active at this time.'>
<cfset nextDeadline = ''>
<cfloop query="#mealInfo#">
	<cfset deadline = DateAdd('h', -1, mel_start)>
	<cfif DateCompare(currentTime, mel_start) LTE 0>
		<cfset nextDeadline = DateFormat(deadline, 'dddd') & ' ' & TimeFormat(deadline, 'short')>
		<cfset nextMeal = "You have until <strong>" & nextDeadline & "</strong> to place a delivery order for <strong>" & mel_name & "</strong>.">
		<cfbreak>
	</cfif>
</cfloop>


<cfoutput>
<input type="hidden" name="order_start" id="order_start" value="#currentTime#">

<h2 class="text-center text-success" style="margin-top: 0px;"><small>for</small><br>#atnName#</h2>

<div class="col-sm-8 col-sm-offset-2">
	<hr>
	
	<p class="lead text-danger text-center">#nextMeal#</p>
	<hr>
	
	<cfloop query="#mealInfo#">
		<cfset thisDeadline = DateAdd('h', -1, mel_start)>
		<cfset deadlinePassed = false>
		<cfset panelColor = 'info'>
		<!---<cfif DateCompare(thisDeadline, currentTime) LTE 0>
			<cfset deadlinePassed = true>
		</cfif>
		<cfif deadlinePassed>
			<cfset panelColor = 'danger'>
		</cfif>
		<cfif mel_name EQ nextMeal>
			<cfset panelColor = 'warning'>
		</cfif>--->
		
		
		<cfquery datasource="magsuite" name="deliveryInfo">
			SELECT dpt.dpt_name AS department,
				dpt.dpt_location AS deliveryLocation,
				atn.atn_name AS orderedBy,
				atn.atn_id AS orderedByID,
				del.del_created AS orderedDate,
				del.del_updated AS updatedDate,
				del.del_food AS foodOrdered,
				del.del_comment AS orderComment,
				del.out_delivery,
				del.delivered
			FROM delivery del, 
				department dpt, 
				attendees atn
			WHERE del.dpt_id = dpt.dpt_id
			AND del.del_enteredBy = atn.atn_id
			AND del.mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#mel_id#">
			AND del.atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#atnID#">
		</cfquery>
		
		<cfif mealInfo.currentRow MOD 2>
		<div class="row">
		</cfif>
			<div class="col-sm-6">
				<div class="panel panel-#panelColor#">
					<div class="panel-heading">
						<h3 class="panel-title">
							<strong>#mel_name#</strong><br>
							<small>
								<cfif deadlinePassed>
									Delivery ordering is now closed. Please visit Room 6176 between 
								<cfelse>
									Order by #DateFormat(thisDeadline, 'dddd')# #TimeFormat(thisDeadline, 'short')#<br>
								</cfif>
								#TimeFormat(mel_start, 'h tt')# to #TimeFormat(mel_end, 'h tt')#
							</small>
						</h3>
					</div>
					<div class="panel-body">
						<cfif deliveryInfo.recordCount EQ 0>
							<p class="text-center">You have not placed an order.</p>
						<cfelse>
							<cfinclude template="/views/delivery/_meal_info.cfm">
						</cfif>
						<p class="text-center">
							<cfif deadlinePassed>
								You can no longer place an order for this meal. Please visit room 6176 to receive food.
							<cfelse>
								<button type="submit" name="orderMeal" id="orderMeal" value="#mel_name#" class="btn btn-lg btn-block btn-#panelColor#">
									<cfif deliveryInfo.recordCount EQ 0>Order<cfelse>Modify</cfif> #mel_name#
								</button>
								<br>
								<button type="submit" name="orderMeal" id="orderMeal" value="CANCEL#mel_name#" class="btn btn-xs btn-default">Cancel my order</button>
							</cfif>
						</p>
					</div>
				</div>
			</div>
		<cfif NOT mealInfo.currentRow MOD 2>
		</div>
		</cfif>
	</cfloop>
	
</div>
</cfoutput>