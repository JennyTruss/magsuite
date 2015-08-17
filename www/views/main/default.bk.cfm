<cfsilent>
	<cfscript>
		rc.title = 'MAGClassic September 11-13, 2015';
	</cfscript>
</cfsilent>

<cfoutput>
  <div class="row">
  	<div class="col-sm-4">
    	<a href="#buildURL('shifts')#" class="btn btn-block btn-lg btn-success">Job Descriptions</a>
    </div>
    <div class="col-sm-4">
    	<a href="#buildURL('rules.volunteers')#" class="btn btn-block btn-lg btn-warning">Staff Suite Volunteer Rules</a>
    </div>
    <div class="col-sm-4">
    	<a href="#buildUrl('contact')#" class="btn btn-block btn-lg btn-info">Contact the Chefs</a>
    </div>
  </div>
  <hr>
  <h3>We Want YOU to Volunteer in the Staff Suite!</h3>

  <div class="row">
  	<form name="volunteerFrm" id="volunteerFrm" method="post" action="#buildUrl('/')#" class="form form-horizontal">
    	<p class="help-block"><strong>All fields required</strong></p>
      <div class="form-group">
      	<label for="name" class="control-label col-sm-4">Name:</label>
        <div class="col-sm-6">
        	<input type="text" name="name" id="name" class="form-control">
        </div>
      </div>
      <div class="form-group">
      	<label for="email" class="control-label col-sm-4">Email:</label>
        <div class="col-sm-6">
        	<input type="text" name="email" id="email" class="form-control">
        </div>
      </div>
      <div class="form-group">
      	<label for="prevExp" class="control-label col-sm-4">Previous Food Experience:</label>
        <div class="col-sm-6">
        	<input type="text" name="prevExp" id="prevExp" class="form-control">
        </div>
      </div>
      <div class="form-group">
      	<label for="name" class="control-label col-sm-4">Maximum number of hours willing to commit:</label>
        <div class="col-sm-6">
        	<input type="text" name="name" id="name" class="form-control">
        </div>
      </div>
      <div class="form-group">
      	<label for="name" class="control-label col-sm-4">Name:</label>
        <div class="col-sm-6">
        	<input type="text" name="name" id="name" class="form-control">
        </div>
      </div>
      <div class="form-group">
      	<label for="name" class="control-label col-sm-4">Name:</label>
        <div class="col-sm-6">
        	<input type="text" name="name" id="name" class="form-control">
        </div>
      </div>
      <div class="form-group">
      	<label for="name" class="control-label col-sm-4">Name:</label>
        <div class="col-sm-6">
        	<input type="text" name="name" id="name" class="form-control">
        </div>
      </div>
    </form>
  </div>
</cfoutput>

		<ol>
			<li>Name:</li>
			<li>Best Email to Reach You:</li>
			<li>Nickname we may have used for you (It helps us remember):</li>
			<li>What position have you worked in the Staff Suite:</li>
			<li>What you are interested in learning more about in Staff Suite:</li>
			<li>Most memorable moment in Staff Suite:</li>
			<li>Will you need a badge?</li>
			<li>Will you need crash space?</li>
			<li>Maximum number of hours you are willing to commit over the weekend (Thursday evening to Sunday night):</li>
			<li>What is your experience working with food?</li>
			<li>Anything else you would like to add that we should know about or any questions/comments you'd like to leave.</li>
		</ol>
