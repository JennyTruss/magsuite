
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
		<input type="checkbox" onClick="getFoodOrder(this)" value="stewed beef" <cfif FindNoCase('stewed beef', foodOrdered) GT 0>checked</cfif>> Stewed Beef in Gravy
	</label>
	<span class="help-block">Gravy is made with beef stock and gluten free roux and will be gluten free.</span>
</div>
</cfif>

<div class="checkbox">
	<label class="lead">
		<input type="checkbox" onClick="getFoodOrder(this)" value="rice" <cfif FindNoCase('rice', foodOrdered) GT 0>checked</cfif>> Rice
	</label>
</div>
<div class="checkbox">
	<label class="lead">
		<input type="checkbox" onClick="getFoodOrder(this)" value="vegetables" <cfif FindNoCase('vegetables', foodOrdered) GT 0>checked</cfif>> Roasted Vegetables
	</label>
	<span class="help-block">Carrots, potatoes, onions cooked separately from any meat</span>
</div>