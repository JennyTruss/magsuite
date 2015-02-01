<cfset rc.title = "Menu" />	<!--- set a variable to be used in a layout --->

<cfoutput>
<h1>#rc.title# - Tentative</h1>

<p class="lead">The tentative menu is placed here in advance to assist you in determining your food needs during MAGFest. This free option is available to Staff, Guests, and volunteers with at least 12 hours. You will need your badge to gain access to the suite.</p>

<div class="panel-group" id="menu" role="tablist" aria-multiselectable="true">
	<div class="panel panel-info">
		<div class="panel-heading" role="tab" id="snacks-bevsHead">
			<a data-toggle="collapse" data-parent="##menu" href="##snacks-bevs" aria-expanded="true" aria-controls="snacks-bevs">
				<h2 class="h4">Snacks &amp; Beverages</h2>
			</a>
		</div>
		<div id="snacks-bevs" class="panel-collapse collapse" role="tabpanel" aria-labelledby="snacks-bevsHead">
			<div class="panel-body">
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Snacks</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Whole Fruit</h4>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Utz Chips</h4>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Veggie Straws</h4>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Nutrigrain Bars</h4>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">Beverages</h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Gatorade</h4>
								<p class="list-group-item-text small">Fruit Punch, Orange, Lemon Lime</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Water</h4>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Coffee</h4>
								<p class="list-group-item-text small">Cream, Sugar, Sugar Substitute available</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="panel panel-info">
		<div class="panel-heading" role="tab" id="fridayHead">
			<a data-toggle="collapse" data-parent="##menu" href="##friday" aria-expanded="true" aria-controls="friday">
				<h2 class="h4">Friday, January 23, 2015</h2>
			</a>
		</div>
		<div id="friday" class="panel-collapse collapse" role="tabpanel" aria-labelledby="fridayHead">
			<div class="panel-body">
				<div class="col-sm-4">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h3 class="panel-title">Breakfast (No deliveries)<br><small>7am-11am</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Assortment of Muffins</h4>
								<p class="list-group-item-text small">Variety will not be determined until day before</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Gluten Free Cereal</h4>
								<p class="list-group-item-text small">Available for no-gluten staff only<br>Comes with option of regular or soy milk</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Instant Oatmeal</h4>
							</li>
							<li class="list-group-item">
								Comes with choice of snack item
							</li>
						</ul>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">Lunch<br><small>12pm-4pm</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Sandwiches<br> <small>2 or 1 with salad</small></h4>
								<p class="list-group-item-text small">Turkey or Ham, American Cheese, Peanut Butter, SunButter, Grape Jelly, White or Gluten Free Bread<br>Gluten Free Bread available for no-gluten staff only</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Salad</h4>
								<p class="list-group-item-text small">Prepackaged mix. Comes with choice of dressing.</p>
							</li>
							<li class="list-group-item">
								Comes with choice of snack item
							</li>
						</ul>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">Dinner/Overnight <small><em>(No Overnight Deliveries)</em><br>5pm-9pm/9pm-4am</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Stewed Beef in Gravy</h4>
								<p class="list-group-item-text small">Gravy is made with beef stock and gluten free roux and will be gluten free.<br>Option of either beans or grilled tofu are available for vegetarian and vegan attendees</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Roasted Vegetables</h4>
								<p class="list-group-item-text small">Carrots, potatoes, onions. Cooked separately from any meat.</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Rice</h4>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="panel panel-info">
		<div class="panel-heading" role="tab" id="saturdayHead">
			<a data-toggle="collapse" data-parent="##menu" href="##saturday" aria-expanded="true" aria-controls="saturday">
				<h2 class="h4">Saturday, January 24, 2015</h2>
			</a>
		</div>
		<div id="saturday" class="panel-collapse collapse" role="tabpanel" aria-labelledby="saturdayHead">
			<div class="panel-body">
				<div class="col-sm-4">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h3 class="panel-title">Breakfast (No deliveries)<br><small>7am-11am</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Sausage Gravy (Gluten Free) &amp; Biscuits</h4>
								<p class="list-group-item-text">Pork Breakfast sausage, milk, gluten free roux with the option of Bisquick biscuits</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Gluten Free Cereal</h4>
								<p class="list-group-item-text small">Available for no-gluten staff only<br>Comes with option of regular or soy milk</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Instant Oatmeal</h4>
							</li>
							<li class="list-group-item">
								Comes with choice of snack item
							</li>
						</ul>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">Lunch<br><small>12pm-4pm</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Gazpacho</h4>
								<p class="list-group-item-text small">Tomato juice, V8 juice, carrots, celery, onion, tabasco on the side<br>Comes with 1 of the below options</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Sandwiches<br> <small>2 or 1 with salad or gazpacho</small></h4>
								<p class="list-group-item-text small">Turkey or Ham, American Cheese, Peanut Butter, SunButter, Grape Jelly, White or Gluten Free Bread<br>Gluten Free Bread available for no-gluten staff only</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Salad</h4>
								<p class="list-group-item-text small">Prepackaged mix. Comes with choice of dressing.</p>
							</li>
							<li class="list-group-item">
								Comes with choice of snack item
							</li>
						</ul>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">Dinner/Overnight <small><em>(No Overnight Deliveries)</em><br>5pm-9pm/9pm-4am</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Roasted Chicken</h4>
								<p class="list-group-item-text small">Roasted in olive oil and seasonings.<br>Option of either beans or grilled tofu are available for vegetarian and vegan attendees</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Corn</h4>
								<p class="list-group-item-text small">Cooked separately from any meat.</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Rice</h4>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="panel panel-info">
		<div class="panel-heading" role="tab" id="sundayHead">
			<a data-toggle="collapse" data-parent="##menu" href="##sunday" aria-expanded="true" aria-controls="sunday">
				<h2 class="h4">Sunday, January 25, 2015</h2>
			</a>
		</div>
		<div id="sunday" class="panel-collapse collapse" role="tabpanel" aria-labelledby="sundayHead">
			<div class="panel-body">
				<div class="col-sm-4">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h3 class="panel-title">Breakfast (No deliveries)<br><small>7am-11am</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Pancakes</h4>
								<p class="list-group-item-text small">Comes with option of regular or sugar-free syrup and margarine</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Gluten Free Cereal</h4>
								<p class="list-group-item-text small">Available for no-gluten staff only<br>Comes with option of regular or soy milk</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Instant Oatmeal</h4>
							</li>
							<li class="list-group-item">
								Comes with choice of snack item
							</li>
						</ul>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">Lunch<br><small>12pm-4pm</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Hot Sandwich</h4>
								<p class="list-group-item-text small">Choice of Pulled Pork or Shredded Chicken <br>Gluten Free Bread available for no-gluten staff only<Br>Comes with coleslaw</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Pulled Pork</h4>
								<p class="list-group-item-text small">Pork slowly roasted in apple cider vinegar, thyme, rosemary, red pepper flakes, garlic, onion, paprika, salt, pepper</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Shredded Chicken</h4>
								<p class="list-group-item-text small">Skinless boneless chicken breast, chicken stock, oil, salt, pepper<Br>Sauce on the side</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Sandwiches<br> <small>2 or 1 with coleslaw</small></h4>
								<p class="list-group-item-text small">Turkey or Ham, American Cheese, Peanut Butter, SunButter, Grape Jelly, White or Gluten Free Bread<br>Gluten Free Bread available for no-gluten staff only</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Coleslaw</h4>
								<p class="list-group-item-text small">Cabbage, Red Cabbage, Onion, Sugar, Celery Seed, White Vinegar, Vegetable Oil</p>
							</li>
							<li class="list-group-item">
								Comes with choice of snack item
							</li>
						</ul>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">Dinner/Overnight <small><em>(No Overnight Deliveries)</em><br>5pm-9pm/9pm-4am</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Chicken Adobo</h4>
								<p class="list-group-item-text small">Stewed chicken, carrots, potatoes, bay leaf, garlic, vinegar, Tamari gluten free sauce, chicken stock</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Vegetable Adobo<Br> <small>(Vegetarian/Vegan Option)</small></h4>
								<p class="list-group-item-text small">Grilled tofu marinated in Tamari sauce with stewed carrots, potatoes, bay leaf, garlic, vinegar, Tamari gluten free sauce</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Rice</h4>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="panel panel-info">
		<div class="panel-heading" role="tab" id="mondayHead">
			<a data-toggle="collapse" data-parent="##menu" href="##monday" aria-expanded="true" aria-controls="monday">
				<h2 class="h4">Monday, January 26, 2015</h2>
			</a>
		</div>
		<div id="monday" class="panel-collapse collapse" role="tabpanel" aria-labelledby="mondayHead">
			<div class="panel-body">
				<div class="col-sm-4">
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h3 class="panel-title">Breakfast (No deliveries)<br><small>7am-11am</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Bread Pudding</h4>
								<p class="list-group-item-text small">Bread, eggs, milk, sugar, nutmeg, vanilla<br>Option of regular or sugar-free syrup</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Rice Pudding</h4>
								<p class="list-group-item-text small">Rice, milk, sugar, nutmeg<br>Option of regular or sugar-free syrup</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Gluten Free Cereal</h4>
								<p class="list-group-item-text small">Available for no-gluten staff only<br>Comes with option of regular or soy milk</p>
							</li>
							<li class="list-group-item text-muted">
								<h4 class="list-group-item-heading">Instant Oatmeal</h4>
							</li>
							<li class="list-group-item">
								Comes with choice of snack item
							</li>
						</ul>
					</div>
				</div>
				
				<div class="col-sm-4">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">Lunch (No deliveries)<br><small>12pm-4pm</small></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Leftovers</h4>
								<p class="list-group-item-text small">Anything we still have must go. Feel free to bring tupperware.</p>
							</li>
							<li class="list-group-item">
								<h4 class="list-group-item-heading">Suite closed by 4pm</h4>
								<p class="list-group-item-text small">We will close either when the leftovers are gone or 4pm, whichever happens first.</p>
							</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
</div>

<p>With the exception of overnight and leftovers on Sunday, each meal is one serving per person unless seconds are called. Please refer to the <a href="#buildUrl('rules')#">Suite Rules</a> about food delivery. There are no serving limits during overnight. Hot food will be available overnight until it is gone or 4am, whichever comes first.</p>

<p><strong>Disclaimers:</strong><p> 
<ul>
	<li>The menu is subject to change at any moment at the discretion of the Chefs.</li> 
	<li>We have made every effort to accomodate <strong>most</strong> food restrictions in the preparation and service of meals. We are sorry for the inconvenience, but we are unable to accomodate all requests.</li> 
	<li>We do not have the full functionality and staff to prepare individual meals.</li> 
	<li>We do not purchase, and therefore do not serve seafood of any kind.</li>
	<li>We do not serve sodas.</li>
	<li>Absolutely no alcohol is allowed while the suite is open.</li>
</ul>
</cfoutput>