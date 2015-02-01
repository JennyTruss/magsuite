<p class="lead text-center">Enter your badge number to continue.</p>

<div class="row enter-badge">
	<div class="col-sm-6 col-sm-offset-3">
		<div class="col-xs-12">
			<input type="text" class="form-control input-lg" name="badge_number" id="badge_number" value="">
		</div>
		<div class="row">
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(7)"><strong>7</strong></button>
			</div>
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(8)"><strong>8</strong></button>
			</div>
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(9)"><strong>9</strong></button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(4)"><strong>4</strong></button>
			</div>
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(5)"><strong>5</strong></button>
			</div>
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(6)"><strong>6</strong></button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(1)"><strong>1</strong></button>
			</div>
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(2)"><strong>2</strong></button>
			</div>
			<div class="col-xs-4">
				<button type="button" class="btn btn-primary btn-lg btn-block" onClick="addNum(3)"><strong>3</strong></button>
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
				<button type="submit" class="btn btn-success btn-lg btn-block" id="enterBadge" name="enterBadge" value="continue"><strong>Continue</strong></button>
			</div>
		</div>
	</div>
</div>


<script type="application/javascript">
	function addNum(thisNum){
		var val = orderDelivery.badge_number.value;
		if(val.length <= 5) {
			val += thisNum;
		}
		orderDelivery.badge_number.value = val;
	}
	
	function clearLastNum(){
		var val = orderDelivery.badge_number.value;
		if(val.length > 0) {
			val = val.substring(0, val.length - 1);
			orderDelivery.badge_number.value = val;
		}
	};
</script>