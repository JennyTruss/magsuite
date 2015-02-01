<p>Sandwiches are served on white bread unless indicated as gluten free. Gluten free bread is reserved for those who indicated No Gluten in their food restrictions form.</p>
<p>A limited amount of Sunbutter is available for those with nut allergies wishing for something similar to a peanut butter and jelly sandwich. Select anything with peanut butter and leave a note about Sunbutter. You must have left a note in your food restrictions to get this item.</p>
<p>A variety of snack items will be delivered to the department to select from to accompany your meal.</p>
<p>The Coleslaw is vinegar based and not mayonnaise based.</p>

<cfif getRestrictions.gluten>
<cfif NOT getRestrictions.vegan AND not getRestrictions.vegetarian>
<cfif getRestrictions.pork>
<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="pulled pork|coleslaw" <cfif FindNoCase('pulled pork|coleslaw', foodOrdered) GT 0>checked</cfif>> Pulled Pork Sandwich and Coleslaw
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="pulled pork" <cfif FindNoCase('pulled pork|coleslaw', foodOrdered) GT 0>checked</cfif>> Pulled Pork Sandwich
	</label>
</div>
</cfif>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="shredded chicken|coleslaw" <cfif FindNoCase('shredded chicken|coleslaw', foodOrdered) GT 0>checked</cfif>> Shredded Chicken Sandwich and Coleslaw
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="shredded chicken" <cfif FindNoCase('shredded chicken|coleslaw', foodOrdered) GT 0>checked</cfif>> Shredded Chicken Sandwich
	</label>
</div>
</cfif>
<cfelse>
<cfif NOT getRestrictions.vegan AND not getRestrictions.vegetarian>
<cfif getRestrictions.pork>
<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="pulled pork (gluten free)|coleslaw" <cfif FindNoCase('pulled pork (gluten free)|coleslaw', foodOrdered) GT 0>checked</cfif>> Pulled Pork Sandwich (Gluten Free) and Coleslaw (Vinegar Based)
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="pulled pork (gluten free)" <cfif FindNoCase('pulled pork (gluten free)|coleslaw', foodOrdered) GT 0>checked</cfif>> Pulled Pork Sandwich (Gluten Free)
	</label>
</div>
</cfif>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="shredded chicken (gluten free)|coleslaw" <cfif FindNoCase('shredded chicken (gluten free)|coleslaw', foodOrdered) GT 0>checked</cfif>> Shredded Chicken Sandwich (Gluten Free) and Coleslaw (Vinegar Based)
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="shredded chicken (gluten free)" <cfif FindNoCase('shredded chicken (gluten free)|coleslaw', foodOrdered) GT 0>checked</cfif>> Shredded Chicken Sandwich (Gluten Free)
	</label>
</div>
</cfif>
</cfif>


<cfinclude template="/views/delivery/_sandwiches.cfm">