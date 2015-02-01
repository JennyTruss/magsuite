<cfset rc.title = "MAGFest 13 Staff Suite" />	<!--- set a variable to be used in a layout --->

<cfoutput>
<h1>#rc.title#</h1>

<p class="lead">The Staff Suite will open for breakfast on Friday at 7am and remain open until Monday afternoon, once the leftovers are gone. Snacks and drinks are available between meals. Seating is available, but limited.</p>


<h2>Located in Room 6176 in hotel <small><a href="##location">See Map</a></small></h2>

<div class="row">
	<div class="col-sm-3">
		<a class="btn btn-primary btn-lg btn-block " href="#buildUrl('delivery')#">Order Delivery</a>
	</div>
	
	<div class="col-sm-3">
		<a class="btn btn-warning btn-lg btn-block" href="#buildUrl('menu')#">Full Menu</a>
	</div>
	
	<div class="col-sm-3">
		<a class="btn btn-info btn-lg btn-block" href="#buildUrl('options')#">Other Options</a>
	</div>
	
	<div class="col-sm-3">
		<a class="btn btn-danger btn-lg btn-block" href="#buildUrl('rules')#">Suite Rules</a>
	</div>
</div>

<h2>Schedule</h2>
<p>Meal service times have changed this year. Breakfast and lunch are now 4 hours long and each meal starts 1 hour sooner. Below is an overview of the menu. The full menu with additional options can be viewed <strong><a href="#buildUrl('menu')#">here</a></strong>.</p>
<div class="row">
	<div class="col-md-3 col-sm-6">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h3 class="panel-title"><strong>Breakfast</strong></h3>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><strong>7 am to 11 am</strong></li>
				<li class="list-group-item text-danger"><strong>No Deliveries</strong></li>
				<li class="list-group-item">Friday: Muffins</li>
				<li class="list-group-item">Saturday: Sausage Gravy</li>
				<li class="list-group-item">Sunday: Pancakes</li>
				<li class="list-group-item">Monday: Bread Pudding</li>
			</ul>
		</div>
	</div>
	
	<div class="col-md-3 col-sm-6">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title"><strong>Lunch</strong></h3>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><strong>12 pm to 4 pm</strong></li>
				<li class="list-group-item text-success"><strong>Delivery available</strong></li>
				<li class="list-group-item">Friday: Cold Sandwiches</li>
				<li class="list-group-item">Saturday: Gazpacho</li>
				<li class="list-group-item">Sunday: Hot Sandwiches</li>
				<li class="list-group-item">Monday: Leftovers</li>
			</ul>
		</div>
	</div>
	
	<div class="col-md-3 col-sm-6">
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3 class="panel-title"><strong>Dinner</strong></h3>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><strong>5 pm to 9 pm</strong></li>
				<li class="list-group-item text-success"><strong>Delivery available</strong></li>
				<li class="list-group-item">Friday: Stewed Beef</li>
				<li class="list-group-item">Saturday: Roasted Chicken</li>
				<li class="list-group-item">Sunday: Chicken Adobo</li>
				<li class="list-group-item">Monday: SUITE CLOSED</li>
			</ul>
		</div>
	</div>
	
	<div class="col-md-3 col-sm-6">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title"><strong>Overnight</strong> <small>No serving limits</small></h3>
			</div>
			<ul class="list-group">
				<li class="list-group-item"><strong>9 pm to 4 am</strong></li>
				<li class="list-group-item text-danger"><strong>No Deliveries</strong></li>
				<li class="list-group-item">Friday: Stewed Beef</li>
				<li class="list-group-item">Saturday: Roasted Chicken</li>
				<li class="list-group-item">Sunday: Chicken Adobo</li>
				<li class="list-group-item">Monday: SUITE CLOSED</li>
			</ul>
		</div>
	</div>
</div>

<h2>Rules Overview <small><a href="#buildUrl('rules')#">Full rule list</a></small></h2>
<ul>
	<li>To access the Staff Suite, you will need a valid Staff badge, Guest badge, or marked Volunteer ribbon. If you are a volunteer signed up for at least 12 hours of shifts, you will not be eligible to access the Staff Suite until you have worked at least 6 hours. Once you have done so, be sure to have your Department Head sign your hours sheet and return to Staffing Operations to have your volunteer ribbon marked. We will not accept signed sheets. You will need to visit Staffing Operations to have your ribbon marked. There is no +1 access to the suite. You will need the proper badge.</li>
	<li>One serving per person per meal unless seconds are called. The exception to this rule is Overnight and Leftovers.</li>
	<li>You must be on shift to receive food delivery. Your food will be delivered to the indicated location and you will not be able to receive an additional serving until seconds are called.</li>
	<li>Food delivery is for staff and volunteers only.</li>
	<li>You cannot pick up food for others. The badge holder needs to be present to receive food.</li>
	<li>Let the server know if your food is to go so that your food can be placed in the appropriate to go container.</li>
	<li>Do not eat in the hallways and elevator banks.</li>
	<li>Please be courteous to the volunteers and to your fellow patrons. This includes volume, politeness and keeping lines moving.</li>
	<li>Vaping/E-cig/smoking of any kind is prohibited inside the Gaylord.</li>
	<li>If there are any issues or questions, please find someone in a Chef coat and let them know.</li>
</ul>

<h2 id="location">Location</h2>
<p>The Staff Suite will be located on the 6th floor again, but this time in room 6176. Make a right after exiting the elevator bank and go all the way to the end of the hall.</p>

<p class="text-center"><img src="/assets/images/map.jpg" class="center-block"></p>


</cfoutput>