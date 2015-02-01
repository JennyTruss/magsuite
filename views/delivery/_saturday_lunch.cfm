<p>Sandwiches are served on white bread unless indicated as gluten free. Gluten free bread is reserved for those who indicated No Gluten in their food restrictions form.</p>
<p>A limited amount of Sunbutter is available for those with nut allergies wishing for something similar to a peanut butter and jelly sandwich. Select anything with peanut butter and leave a note about Sunbutter. You must have left a note in your food restrictions to get this item.</p>
<p>A variety of snack items will be delivered to the department to select from to accompany your meal.</p>

<cfset showGluten = ' (gluten free)'>
<cfif getRestrictions.gluten>
	<cfset showGluten = ''>
</cfif>

<cfoutput>
<cfif NOT getRestrictions.vegan AND NOT getRestrictions.vegetarian>
<cfif getRestrictions.pork>
<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|ham and cheese#showGluten#" <cfif FindNoCase('gazpacho|ham and cheese#showGluten#', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Ham and Cheese Sandwich#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|ham no cheese#showGluten#" <cfif FindNoCase('gazpacho|ham no cheese#showGluten#', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Ham No Cheese Sandwich#showGluten#
	</label>
</div>
</cfif>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|turkey and cheese#showGluten#" <cfif FindNoCase('gazpacho|turkey and cheese#showGluten#', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Turkey and Cheese Sandwich#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|turkey no cheese#showGluten#" <cfif FindNoCase('gazpacho|turkey no cheese#showGluten#', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Turkey No Cheese Sandwich#showGluten#
	</label>
</div>
</cfif>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|cheese sandwich#showGluten#" <cfif FindNoCase('gazpacho|cheese sandwich#showGluten#', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Cheese Sandwich#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|pbj#showGluten#" <cfif FindNoCase('gazpacho|pbj#showGluten#', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Peanut and Butter Sandwich#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|peanut butter#showGluten#" <cfif FindNoCase('gazpacho|peanut butter#showGluten#', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Peanut Butter Sandwich#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|jelly#showGluten#" <cfif FindNoCase('gazpacho|jelly#showGluten#', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Jelly Sandwich#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="gazpacho|salad" <cfif FindNoCase('gazpacho|salad', foodOrdered) GT 0>checked</cfif>> Gazpacho &amp; Salad
	</label>
</div>
</cfoutput>


<cfinclude template="/views/delivery/_sandwiches.cfm">

<p class="alert alert-danger">Dressing choices are Ranch and Italian</p>
