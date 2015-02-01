<cfset myFood = ReplaceNoCase(deliveryInfo.foodOrdered, '|', ', ', 'all')>
<cfset myFood = reReplace(lCase(myFood),'\b([a-z])','\U\1','all')>

<cfoutput>
<cfif deliveryInfo.out_delivery>
	<p class="alert alert-warning"><strong>Out for Delivery</strong></p>
<cfelseif deliveryInfo.delivered>
	<p class="alert alert-success"><strong>Delivered</strong></p>
</cfif>

<dl>
	<dt>Department</dt>
	<dd>#deliveryInfo.department#</dd>
	
	<dt>Deliver to</dt>
	<dd>#deliveryInfo.deliveryLocation#</dd>
	
	<dt>Order</dt>
	<dd>#myFood#</dd>
	
	<dt>Order Placed</dt>
	<dd>
		#DateFormat(deliveryInfo.orderedDate, 'ddd, mmm d')# #TimeFormat(deliveryInfo.orderedDate, 'short')#
		<cfif deliveryInfo.orderedByID NEQ atnID>
			<br>By #deliveryInfo.orderedBy#
		</cfif>
	</dd>
	
	<cfif DateCompare(deliveryInfo.orderedDate, deliveryInfo.updatedDate) NEQ 0>
	<dt>Order Last Updated</dt>
	<dd>
		#DateFormat(deliveryInfo.updatedDate, 'ddd, mmm d')# #TimeFormat(deliveryInfo.updatedDate, 'short')#
	</dd>
	</cfif>
	
	<dt>Comments</dt>
	<dd>#deliveryInfo.orderComment#</dd>
</dl>
</cfoutput>