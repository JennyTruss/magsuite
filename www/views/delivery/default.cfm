<cfset rc.title = "Order Food Delivery" />	<!--- set a variable to be used in a layout --->

<cfoutput>
<h1 class="text-center">#rc.title#</h1>
<form name="orderDelivery" id="orderDelivery" action="#buildUrl('delivery')#" method="post">
<cfif isDefined('FORM.atnID')>
	<input type="hidden" name="atnID" id="atnID" value="#FORM.atnID#">
	
	<cfquery datasource="magsuite" name="atnInfo">
		SELECT atn.atn_name AS name
			FROM attendees atn
		 WHERE atn.atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.atnID#">
	</cfquery>
	
	<cfset atnName = atnInfo.name>
</cfif>
</cfoutput>


<cfset currentTime = DateAdd('h', 1, Now())>


<cfif isDefined('FORM.enterBadge')>

	<cfinclude template="/views/delivery/_verify_restrictions.cfm">

<cfelseif isDefined('FORM.verified')>

	<cfset atnID = FORM.atnID>
	
	<cfif FORM.verified EQ 'group'>
		<h1>Group Order</h1>
	<cfelseif FORM.verified EQ 'individual'>
		<cfinclude template="/views/delivery/_meal_options.cfm">
	<cfelse>
		<cflocation addtoken="no" url="#buildUrl('main.error')#">
	</cfif>

<cfelseif isDefined('FORM.cancelOrder')>

	<cfif FORM.cancelOrder>
		<cfquery datasource="magsuite">
			DELETE FROM delivery
			WHERE mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.mealID#">
			AND atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.atnID#">
		</cfquery>
	</cfif>
	
	<cfinclude template="/views/delivery/_meal_options.cfm">

<cfelseif isDefined('FORM.orderMeal')>

	<cfinclude template="/views/delivery/_order_meal.cfm">

<cfelseif isDefined('FORM.placeOrder')>

	<cfif FORM.placeOrder EQ 'order' and FORM.foodOrdered NEQ ''>
		<cfquery datasource="magsuite" name="deliverySet">
			SELECT del_id
			FROM delivery
			WHERE mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.mealID#">
			AND atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.atnID#">
		</cfquery>
		
		<cfset food = FORM.foodOrdered>
		<cfif Find('|', food) EQ 1>
			<cfset food = Replace(food, '|', '', 'one')>
		</cfif>
		
		<cfif deliverySet.recordCount GT 0>
			<cfquery datasource="magsuite">
				UPDATE delivery
				SET
					dpt_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.departmentID#">,
					del_updated = <cfqueryparam cfsqltype="cf_sql_timestamp" value="#currentTime#">,
					del_food = <cfqueryparam cfsqltype="cf_sql_varchar" value="#food#">,
					del_comment = <cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.deliveryComments#">
				WHERE del_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#deliverySet.del_id#">
			</cfquery>
		<cfelse>
			<cfquery datasource="magsuite">
				INSERT INTO delivery (atn_id, dpt_id, mel_id, del_food, del_comment, del_enteredBy)
				VALUES (
					<cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.atnID#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.departmentID#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.mealID#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#food#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.deliveryComments#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#FORM.atnID#">
				)
			</cfquery>
		</cfif>
	</cfif>

	<cfinclude template="/views/delivery/_meal_options.cfm">

<cfelse>

	<cfinclude template="/views/delivery/_badge_number.cfm">

</cfif>

</form>