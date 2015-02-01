<cfquery datasource="magsuite" name="departmentInfo">
	SELECT *
	FROM department
	ORDER BY dpt_name ASC
</cfquery>

<cfquery datasource="magsuite" name="getRestrictions">
	SELECT *
	FROM restrictions
	WHERE atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.atnID#">
</cfquery>

<cfset thisMeal = FORM.orderMeal>
<cfset cancelMeal = false>

<cfif Find('CANCEL',thisMeal) GT 0>
	<cfset cancelMeal = true>
	<cfset thisMeal = Replace(thisMeal,'CANCEL','')>
</cfif>

<cfquery datasource="magsuite" name="mealID">
	SELECT mel_id, mel_start, mel_end
	FROM meals
	WHERE mel_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#thisMeal#">
</cfquery>

<cfquery datasource="magsuite" name="deliveryInfo">
	SELECT dpt.dpt_name AS department,
		dpt.dpt_id AS departmentID,
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
	AND del.mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#mealID.mel_id#">
	AND del.atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#atnID#">
</cfquery>

<cfset departmentID = 0>
<cfset foodOrdered = ''>
<cfset orderComment = ''>

<cfif deliveryInfo.recordCount GT 0>
	<cfset departmentID = deliveryInfo.departmentID>
	<cfset foodOrdered = deliveryInfo.foodOrdered>
	<cfset orderComment = deliveryInfo.orderComment>
</cfif>



<cfoutput><input type="hidden" name="mealID" id="mealID" value="#mealID.mel_id#"></cfoutput>

<cfif cancelMeal>

	<cfoutput>
	<h2 class="text-center text-danger">Cancel #thisMeal# for #atnName#?</h2>
	<p class="lead text-center text-warning">You will not be able to undo this.</p>
	<div class="col-sm-6 col-sm-offset-3">
		<div class="col-xs-6">
			<button type="submit" name="cancelOrder" id="cancelOrder" class="btn btn-lg bigger btn-block btn-danger" value="false">
				<span class="fa fa-lg fa-times"></span> No
			</button>
		</div>
		<div class="col-xs-6">
			<button type="submit" name="cancelOrder" id="cancelOrder" class="btn btn-lg bigger btn-block btn-success" value="true">
				<span class="fa fa-lg fa-check"></span> Yes
			</button>
		</div>
		
		<cfif deliveryInfo.recordCount GT 0>
			<div class="col-sm-10 col-sm-offset-1" style="margin-top:50px;">
			<cfinclude template="/views/delivery/_meal_info.cfm">
			</div>
		</cfif>
	</div>
	</cfoutput>

<cfelse>

	<cfoutput>
	<h2 class="text-center text-primary">#thisMeal# for #atnName#</h2>
	</cfoutput>
	
	<div class="col-sm-6 col-sm-offset-3" style="padding-bottom: 30px;">
		<cfif deliveryInfo.recordCount GT 0>
		<div class="row">
			<h3>Current Order</h3>
			<cfinclude template="/views/delivery/_meal_info.cfm">
			<hr>
		</div>
		</cfif>
		
		<div class="row">
			<cfoutput>
			<input type="hidden" name="foodOrdered" id="foodOrdered" value="#foodOrdered#">
			<label for="departmentID">What department will you be working in on #DateFormat(mealID.mel_start, 'dddd')# from #TimeFormat(mealID.mel_start,'short')# to #TimeFormat(mealID.mel_end, 'short')# on #DateFormat(mealID.mel_start, 'dddd')#?</label>
			<select name="departmentID" id="departmentID" class="form-control">
				<cfloop query="departmentInfo">
					<option value="#dpt_id#" <cfif departmentID EQ dpt_id>selected</cfif>>#dpt_name# : Delivery drop off to #dpt_location#</option>
				</cfloop>
			</select>
			</cfoutput>
		</div>
			
		<div class="row">
			<div class="well">
				<cfoutput><p>By placing this order, you are indicating that you will be on shift in the selected department from #TimeFormat(mealID.mel_start,'short')# to #TimeFormat(mealID.mel_end, 'short')# on #DateFormat(mealID.mel_start, 'dddd')#. Your food will be delivered to the designated destination and you will not be able to receive food in the suite unless seconds are offered.</p></cfoutput>
				<p><strong>A selection of Gatorade and water will be delivered with the meals to the indicated department for you to choose from.</strong></p>
			</div>
		</div>
		
		<div class="row">
			<cfset mealForm = Replace(LCase(thisMeal), ' ', '_', 'all')>
			<cfinclude template="/views/delivery/_#mealForm#.cfm">
		</div>
		
		<div class="row">
			<input type="text" name="deliveryComments" id="deliveryComments" class="form-control" placeholder="Additional Comments" maxlength="50" value="<cfoutput>#orderComment#</cfoutput>">
		</div>
		
		<div class="row">
			<p class="alert alert-warning">Your food will be marked with an "Eat by" time. It is recommended that your food be consumed or properly stored by this time. Consuming the food after this time without properly storing it is at your own risk as food safe temperature cannot be guaranteed within the container at this point.</p>
		</div>
			
		<div class="row">
			<div class="col-xs-6">
				<button type="submit" name="placeOrder" id="placeOrder" class="btn btn-lg btn-block btn-danger" value="cancel">
					<span class="fa fa-lg fa-times"></span> Cancel
				</button>
			</div>
			<div class="col-xs-6">
				<button type="submit" name="placeOrder" id="placeOrder" class="btn btn-lg btn-block btn-success" value="order">
					<span class="fa fa-lg fa-cutlery"></span> Place Order
				</button>
			</div>
		</div>
		</div>
	</div>

</cfif>

<script type="application/javascript">
	function getFoodOrder(obj){
		var val = orderDelivery.foodOrdered.value;
		var thisText = '|' + obj.value;
		if (obj.checked) {
			if (obj.type == 'radio') {
				val = thisText;
			} else {
				val = val + thisText;
			}
		} else {
			val = val.replace(thisText,'');
		}
		orderDelivery.foodOrdered.value = val;
	};
	
</script>