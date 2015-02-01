
<cfif getRestrictions.vegan or getRestrictions.vegetarian>
<div class="checkbox">
	<label class="lead">
		<input type="checkbox" onClick="getFoodOrder(this)" value="vegetable adobo" <cfif FindNoCase('vegetable adobo', foodOrdered) GT 0>checked</cfif>> Vegetable Adobo
	</label>
	<span class="help-block">Grilled tofu marinated in Tamari sauce with stewed carrots, potatoes, bay leaf, garlic, vinegar, Tamari gluten free sauce</span>
</div>
<cfelse>
<div class="checkbox">
	<label class="lead">
		<input type="checkbox" onClick="getFoodOrder(this)" value="chicken adobo" <cfif FindNoCase('chicken adobo', foodOrdered) GT 0>checked</cfif>> Chicken Adobo
	</label>
	<span class="help-block">Stewed chicken, carrots, potatoes, bay leaf, garlic, vinegar, Tamari gluten free sauce, chicken stock</span>
</div>
</cfif>

<div class="checkbox">
	<label class="lead">
		<input type="checkbox" onClick="getFoodOrder(this)" value="rice" <cfif FindNoCase('rice', foodOrdered) GT 0>checked</cfif>> Rice
	</label>
</div>
