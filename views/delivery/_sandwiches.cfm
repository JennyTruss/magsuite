<cfset veg = 'salad'>
<cfif thisMeal EQ 'Sunday Lunch'>
	<cfset veg = 'coleslaw'>
</cfif>

<cfset showGluten = ' (gluten free)'>
<cfif getRestrictions.gluten>
	<cfset showGluten = ''>
</cfif>


<cfoutput>
<cfif NOT getRestrictions.vegan AND not getRestrictions.vegetarian>
	<cfif getRestrictions.pork>
		<cfif getRestrictions.cheese>
			<div class="radio">
				<label class="lead">
					<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="2 ham and cheese#showGluten#" <cfif FindNoCase('2 ham and cheese', foodOrdered) GT 0>checked</cfif>> 2 Ham and Cheese Sandwiches#showGluten#
				</label>
			</div>
			
			<div class="radio">
				<label class="lead">
					<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="ham and cheese|turkey and cheese#showGluten#" <cfif FindNoCase('ham and cheese|turkey and cheese', foodOrdered) GT 0>checked</cfif>> Ham and Cheese &amp; Turkey and Cheese Sandwiches#showGluten#
				</label>
			</div>
			
			<div class="radio">
				<label class="lead">
					<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="ham and cheese|cheese#showGluten#" <cfif FindNoCase('ham and cheese|cheese', foodOrdered) GT 0>checked</cfif>> Ham and Cheese &amp; Cheese Sandwiches#showGluten#
				</label>
			</div>
		</cfif>
		
		<div class="radio">
			<label class="lead">
				<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="2 ham no cheese#showGluten#" <cfif FindNoCase('2 ham no cheese', foodOrdered) GT 0>checked</cfif>> 2 Ham No Cheese Sandwiches#showGluten#
			</label>
		</div>
		
		<div class="radio">
			<label class="lead">
				<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="ham no cheese|turkey no cheese#showGluten#" <cfif FindNoCase('ham no cheese|turkey no cheese', foodOrdered) GT 0>checked</cfif>> Ham No Cheese &amp; Turkey No Cheese Sandwiches#showGluten#
			</label>
		</div>
	</cfif>
	
	<cfif getRestrictions.cheese>
		<div class="radio">
			<label class="lead">
				<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="2 turkey and cheese#showGluten#" <cfif FindNoCase('2 turkey and cheese', foodOrdered) GT 0>checked</cfif>> 2 Turkey and Cheese Sandwiches#showGluten#
			</label>
		</div>
		
		<div class="radio">
			<label class="lead">
				<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="turkey and cheese|cheese#showGluten#" <cfif FindNoCase('turkey and cheese|cheese', foodOrdered) GT 0>checked</cfif>> Turkey and Cheese &amp; Cheese Sandwiches#showGluten#
			</label>
		</div>
	</cfif>
	
	<div class="radio">
		<label class="lead">
			<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="2 turkey no cheese#showGluten#" <cfif FindNoCase('2 turkey no cheese', foodOrdered) GT 0>checked</cfif>> 2 Turkey No Cheese Sandwiches#showGluten#
		</label>
	</div>
	
	<cfif getRestrictions.cheese>
		<div class="radio">
			<label class="lead">
				<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="2 cheese#showGluten#" <cfif FindNoCase('2 cheese', foodOrdered) GT 0>checked</cfif>> 2 Cheese Sandwiches#showGluten#
			</label>
		</div>
	</cfif>
</cfif>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="2 pbj#showGluten#" <cfif FindNoCase('2 pbj', foodOrdered) GT 0>checked</cfif>> 2 Peanut Butter &amp; Jelly Sandwiches#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="2 peanut butter#showGluten#" <cfif FindNoCase('2 peanut butter', foodOrdered) GT 0>checked</cfif>> 2 Peanut Butter Sandwiches#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="2 jelly#showGluten#" <cfif FindNoCase('2 jelly', foodOrdered) GT 0>checked</cfif>> 2 Jelly Sandwiches#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="pbj|peanut butter#showGluten#" <cfif FindNoCase('pbj|peanut butter', foodOrdered) GT 0>checked</cfif>> Peanut Butter and Jelly &amp; Peanut Butter Sandwiches#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="pbj|jelly#showGluten#" <cfif FindNoCase('pbj|jelly', foodOrdered) GT 0>checked</cfif>> Peanut Butter and Jelly &amp; Jelly Sandwiches#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#" <cfif FindNoCase(veg, foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')#
	</label>
</div>

<cfif NOT getRestrictions.vegan AND NOT getRestrictions.vegetarian>
	<cfif getRestrictions.pork>
		<cfif getRestrictions.cheese>
			<div class="radio">
				<label class="lead">
					<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#|ham and cheese#showGluten#" <cfif FindNoCase('#veg#|ham and cheese', foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')# &amp; Ham and Cheese Sandwich#showGluten#
				</label>
			</div>
		</cfif>
		
		<div class="radio">
			<label class="lead">
				<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#|ham no cheese#showGluten#" <cfif FindNoCase('#veg#|ham no cheese', foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')# &amp; Ham No Cheese Sandwich#showGluten#
			</label>
		</div>
	</cfif>
	
	<cfif getRestrictions.cheese>
		<div class="radio">
			<label class="lead">
				<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#|turkey and cheese#showGluten#" <cfif FindNoCase('#veg#|turkey and cheese', foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')# &amp; Turkey and Cheese Sandwich#showGluten#
			</label>
		</div>
	</cfif>
	
	<div class="radio">
		<label class="lead">
			<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#|turkey no cheese#showGluten#" <cfif FindNoCase('#veg#|turkey no cheese', foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')# &amp; Turkey No Cheese Sandwich#showGluten#
		</label>
	</div>
</cfif>

<cfif getRestrictions.cheese>
	<div class="radio">
		<label class="lead">
			<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#|cheese sandwich#showGluten#" <cfif FindNoCase('#veg#|cheese sandwich', foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')# &amp; Cheese Sandwich#showGluten#
		</label>
	</div>
</cfif>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#|pbj#showGluten#" <cfif FindNoCase('#veg#|pbj', foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')# &amp; Peanut Butter and Jelly Sandwich#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#|peanut butter#showGluten#" <cfif FindNoCase('#veg#|peanut butter', foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')# &amp; Peanut Butter Sandwich#showGluten#
	</label>
</div>

<div class="radio">
	<label class="lead">
		<input type="radio" name="thisOrder" onClick="getFoodOrder(this)" value="#veg#|jelly#showGluten#" <cfif FindNoCase('#veg#|jelly', foodOrdered) GT 0>checked</cfif>> #reReplace(lCase(veg),'\b([a-z])','\U\1','all')# &amp; Jelly Sandwich#showGluten#
	</label>
</div>
</cfoutput>