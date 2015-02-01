<!---<h2 class="text-center text-danger"><strong>Sorry!</strong></h2>
<p class="lead text-center">Something has gone wrong. Please contact the <a href="mailto:jennifer.truss@gmail.com">Staff Suite</a> and let them know.</p>
--->




<cfset request.layout = false />
<!--- courtesy of Andreas Schuldhaus --->
<div style="width: 50%; color: red; border: 2px dotted red; background-color: #f9f9f9; padding: 10px;">
	<h1 style="color: red;">ERROR!</h1>
	<div style="width: 100%; text-align: left;">
		<p><b>An error occurred!</b></p>
		<cfoutput>
			<cfif structKeyExists( request, 'failedAction' )>
                <!--- sanitize user supplied value before displaying it --->
				<b>Action:</b> #replace( request.failedAction, "<", "&lt;", "all" )#<br/>
			<cfelse>
				<b>Action:</b> unknown<br/>
			</cfif>
			<b>Error:</b> #request.exception.cause.message#<br/>
			<b>Type:</b> #request.exception.cause.type#<br/>
			<b>Details:</b> #request.exception.cause.detail#<br/>
		</cfoutput>
	</div>
</div>
