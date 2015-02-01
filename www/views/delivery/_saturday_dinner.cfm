
<cfif getRestrictions.vegan or getRestrictions.vegetarian>
<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="tofu" <cfif FindNoCase('tofu', foodOrdered) GT 0>checked</cfif>> Grilled Tofu
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="beans" <cfif FindNoCase('beans', foodOrdered) GT 0>checked</cfif>> Beans
	</label>
</div>
<cfelse>
<div class="checkbox">
	<label class="lead">
		<input type="checkbox" onClick="getFoodOrder(this)" value="roasted chicken" <cfif FindNoCase('roasted chicken', foodOrdered) GT 0>checked</cfif>> Roasted Chicken
	</label>
	<span class="help-block">Roasted in olive oil and seasonings.</span>
</div>
</cfif>

<div class="checkbox">
	<label class="lead">
		<input type="checkbox" onClick="getFoodOrder(this)" value="rice" <cfif FindNoCase('rice', foodOrdered) GT 0>checked</cfif>> Rice
	</label>
</div>
<div class="checkbox">
	<label class="lead">
		<input type="checkbox" onClick="getFoodOrder(this)" value="corn" <cfif FindNoCase('corn', foodOrdered) GT 0>checked</cfif>> Corn
	</label>
	<span class="help-block">Cooked separately from any meat.</span>
</div>