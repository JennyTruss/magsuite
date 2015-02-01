<cfset rc.title = "Badge Check" />	<!--- set a variable to be used in a layout --->


<cfset thisTime = now()>
<cfset snackTime = true>
<cfset thisMeal = 0>
<cfquery datasource="magsuite" name="getMeal">
	SELECT mel_id
	FROM meals
	WHERE enabled = 1
</cfquery>

<cfif getMeal.recordCount GT 0>
	<cfset thisMeal = getMeal.mel_id>
	<cfset snackTime = false>
</cfif>

<cfset verifyRestrictions = false>
<cfset addSnack = false>
<cfset addMeal = false>

<cfif isDefined('FORM.badgeAction')>
	<cfset badge = FORM.badge_number>
	
	<cfquery datasource="magsuite" name="getID">
		SELECT atn.atn_id,
			typ.typ_name
		FROM attendees atn,
			type typ
		WHERE atn.typ_id = typ.typ_id
		AND atn.atn_badgenum = <cfqueryparam cfsqltype="cf_sql_integer" value="#badge#">
	</cfquery>
	
	<cfif getID.recordCount LT 1>
		<cfset alertType = 'danger'>
		<cfset alertMessage = 'Badge number <strong>#badge#</strong> is not eligible for food at this time. The attendee  will need to visit Staffing Operations to have the issue corrected.<br> If they have a properly punched volunteer ribbon, let a manager know.'>
	<cfelse>
		<cfset atnID = getID.atn_id>
		<cfset badgeType = getID.typ_name>
		
		<cfswitch expression="#FORM.badgeAction#">
			<cfcase value="verify">
				<cfset verifyRestrictions = true>
			</cfcase>
			<cfcase value="snack">
				<cfset addSnack = true>
			</cfcase>
			<cfcase value="meal">
				<cfset addMeal = true>
			</cfcase>
		</cfswitch>
	</cfif>
</cfif>

<cfif verifyRestrictions>
	<cfquery datasource="magsuite" name="checkBadge">
		SELECT atn.atn_name AS name,
					 atn.atn_dh AS head,
					 atn.atn_eligible AS isEligible,
					 atn.get_delivery,
					 rst.vegetarian,
					 rst.vegan,
					 rst.pork,
					 rst.gluten,
					 rst.dairy,
					 rst.cheese,
					 rst.rst_notes AS notes,
					 typ.typ_name AS type
			FROM attendees atn,
					 restrictions rst,
					 type typ
		 WHERE atn.atn_id = rst.atn_id
			 AND atn.typ_id = typ.typ_id
			 AND atn.atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#atnID#">
	</cfquery>
	
	<cfif checkBadge.recordCount EQ 0 or (checkBadge.recordCount EQ 1 AND checkBadge.isEligible EQ 0)>
		<cfset alertType = 'danger'>
		<cfset alertMessage = 'Badge #badge# is not eligible to receive food at this time. The #badgeType# will need to bring the signed hours sheet to Staffing Operations in Chesapeake DEF to have hours verified. If the #badgeType# has a punched volunteer ribbon, let a manager know.'>
	<cfelseif checkBadge.recordCount EQ 1>
		<cfoutput>
		<h2 class="text-center text-success">
			<strong>#checkBadge.name#</strong><br>
			<small>#checkBadge.type# ###badge# <cfif checkBadge.head>(Department Head)</cfif><cfif checkBadge.type NEQ "Staff" and checkBadge.type NEQ "Guest">(Volunteer)</cfif></small>
		</h2>
		
		<p class="lead text-center text-<cfif checkBadge.vegetarian>success<cfelse>danger</cfif>">
			<span class="fa fa-<cfif checkBadge.vegetarian>check<cfelse>times</cfif>"></span> Vegetarian
		</p>
		<p class="lead text-center text-<cfif checkBadge.vegan>success<cfelse>danger</cfif>">
			<span class="fa fa-<cfif checkBadge.vegan>check<cfelse>times</cfif>"></span> Vegan
		</p>
		<p class="lead text-center text-<cfif checkBadge.pork or checkBadge.vegan or checkBadge.vegetarian>success<cfelse>danger</cfif>">
			<span class="fa fa-<cfif checkBadge.pork or checkBadge.vegan or checkBadge.vegetarian>check<cfelse>times</cfif>"></span> Pork
		</p>
		<p class="lead text-center text-<cfif checkBadge.gluten>success<cfelse>danger</cfif>">
			<span class="fa fa-<cfif checkBadge.gluten>check<cfelse>times</cfif>"></span> Gluten
		</p>
		<p class="lead text-center text-<cfif checkBadge.dairy or checkBadge.vegan>success<cfelse>danger</cfif>">
			<span class="fa fa-<cfif checkBadge.dairy or checkBadge.vegan>check<cfelse>times</cfif>"></span> Dairy
		</p>
		<p class="lead text-center text-<cfif checkBadge.cheese or checkBadge.vegan>success<cfelse>danger</cfif>">
			<span class="fa fa-<cfif checkBadge.cheese or checkBadge.vegan>check<cfelse>times</cfif>"></span> Cheese
		</p>
		<p class="lead col-sm-6 col-sm-offset-3 text-center">
			Food restriction notes you left for Staff Suite:<br>
			<small><em><cfif checkBadge.notes EQ ''>none<cfelse>#checkBadge.notes#</cfif></em></small>
		</p>
		<p class="lead col-sm-6 col-sm-offset-3">
			<a href="#buildUrl('badge_check')#" class="btn btn-lg btn-block btn-bigger btn-success">Return to Badge Check In</a>
		</p>
		</cfoutput>
	</cfif>
<cfelse>
	<cfif addSnack>
		<cfquery datasource="magsuite">
			INSERT INTO snacks (atn_id)
			VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#atnID#">)
		</cfquery>
		
		<cfset alertType = 'success'>
		<cfset alertMessage = 'Badge #badge# has been successfully added to Snacks'>
	<cfelseif addMeal>
		<cfset thisMeal = FORM.meal_id>
		
		<cfquery datasource="magsuite" name="getMeal">
			SELECT mel_name, mel_seconds
			FROM meals
			WHERE mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#thisMeal#">
		</cfquery>
		
		<cfset mealName = getMeal.mel_name>
		<cfset seconds = getMeal.mel_seconds>
		<cfset addBadge = false>
		
		<cfquery datasource="magsuite" name="checkMeal">
			SELECT bdg_id, bdg_created AS entered
			FROM badges
			WHERE atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#atnID#">
			AND mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#thisMeal#">
		</cfquery>
		
		<cfif checkMeal.recordCount EQ 0>
			<cfquery datasource="magsuite" name="checkDelivery">
				SELECT del.del_id,
					dpt.dpt_name AS department
				FROM delivery del,
					department dpt
				WHERE del.dpt_id = dpt.dpt_id
				AND del.atn_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#atnID#">
				AND del.mel_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#thisMeal#">
			</cfquery>
			
			<cfif checkDelivery.recordCount EQ 0>
				<cfset addBadge = true>
			<cfelse>
				<cfif seconds>
					<cfset addBadge = true>
				<cfelse>
					<cfset alertType = 'danger'>
					<cfset alertMessage = '#mealName# was delivered to #checkDelivery.department# for badge #badge#. The #badgeType# may only have a snack and drink, wait for seconds to be called, or return for the next meal.'>
				</cfif>
			</cfif>
		<cfelse>
			<cfif seconds>
				<cfset addBadge = true>
			<cfelse>
				<cfset alertType = 'danger'>
				<cfset alertMessage = 'Badge #badge# received #mealName# at #TimeFormat(checkMeal.entered,"short")#. The #badgeType# may only have a snack and drink, wait for seconds to be called, or return for the next meal.'>
			</cfif>
		</cfif>
		
		<cfif addBadge>
			<cfquery datasource="magsuite">
				INSERT INTO badges (atn_id, mel_id)
				VALUES (
					<cfqueryparam cfsqltype="cf_sql_integer" value="#atnID#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#thisMeal#">
				)
			</cfquery>
			
			<cfset alertType = 'success'>
			<cfset alertMessage = 'Badge #FORM.badge_number# was successfully added to #mealName#'>
		</cfif>
	</cfif>
	
	<cfoutput>
	<h1 class="h3 text-center">
		Enter Badge Number<br>
		<small>Select if the badge holder is getting a meal or snack, or if you wish to verify their food restrictions.</small>
	</h1>
	
	<cfif isDefined('alertMessage')>
	<div class="alert alert-dismissable alert-#alertType#">
		<button type="button" class="close" data-dismiss="alert"><span class="fa fa-lg fa-times-circle"></span></button>
		<span class="lead">#alertMessage#</span>
	</div>
	</cfif>
	
	<form name="badgeCheck" id="badgeCheck" action="#buildUrl('badge_check')#" method="post">
		<input type="hidden" name="meal_id" id="meal_id" value="#thisMeal#">
		<div class="row enter-badge">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="col-xs-12">
					<input type="text" class="form-control input-lg" name="badge_number" id="badge_number" value="" readonly>
				</div>
				<div class="row">
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numSeven" onClick="addNum(7)"><strong>7</strong></button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numEight" onClick="addNum(8)"><strong>8</strong></button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numNine" onClick="addNum(9)"><strong>9</strong></button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numFour" onClick="addNum(4)"><strong>4</strong></button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numFive" onClick="addNum(5)"><strong>5</strong></button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numSix" onClick="addNum(6)"><strong>6</strong></button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numOne" onClick="addNum(1)"><strong>1</strong></button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numTwo" onClick="addNum(2)"><strong>2</strong></button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" id="numThree" onClick="addNum(3)"><strong>3</strong></button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4">
						<button type="button" class="btn btn-default btn-lg btn-block" onClick="badgeCheck.badge_number.value = ''">
							<strong><span class="fa fa-lg fa-times-circle text-primary"></span></strong>
						</button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(0)"><strong>0</strong></button>
					</div>
					<div class="col-xs-4">
						<button type="button" class="btn btn-default btn-lg btn-block" onClick="clearLastNum();">
							<strong><span class="fa fa-lg fa-arrow-left text-primary"></span></strong>
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<button type="submit" class="btn btn-success btn-lg btn-block" id="badgeAction" name="badgeAction" value="meal" <cfif snackTime>disabled</cfif>><strong>Meal</strong></button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6">
						<button type="submit" class="btn btn-danger btn-block" id="badgeAction" name="badgeAction" value="snack">Snack</button>
					</div>
					<div class="col-xs-6">
						<button type="submit" class="btn btn-warning btn-block" name="badgeAction" id="badgeAction" value="verify">Verify</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	
	</cfoutput>
	
	<script type="application/javascript">
		function addNum(thisNum){
			var val = badgeCheck.badge_number.value;
			if(val.length <= 5) {
				val += thisNum;
			}
			badgeCheck.badge_number.value = val;
		}
		
		function clearLastNum(){
			var val = badgeCheck.badge_number.value;
			if(val.length > 0) {
				val = val.substring(0, val.length - 1);
				badgeCheck.badge_number.value = val;
			}
		};
	</script>
</cfif>