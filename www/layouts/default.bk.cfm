<cfoutput>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

		<title>MAGClassic Staff Suite - #rc.title#</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="#application.css#bootstrap.css">
		<!-- Font-Awesome -->
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <!-- Cover styles -->
    <link rel="stylesheet" href="#application.css#cover.css">
		<!-- MAGSuite styles -->
		<link rel="stylesheet" href="#application.css#magsuite.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">MAGClassic 2015 Staff Suite</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="https://classic.uber.magfest.org/uber/preregistration/form" target="_blank">MAGClassic Registration</a></li>
                  <li><a href="#buildUrl('shifts')#">Jobs</a></li>
                  <li><a href="#buildURL('rules.volunteers')#">Rules</a></li>
                  <li><a href="#buildUrl('contact')#">Contact</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            <h1 class="cover-heading">#rc.title#</h1>
            #body#
          </div>

          <div class="mastfoot">
            <div class="inner">
            </div>
          </div>

        </div>

      </div>

    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="#application.js#bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="#application.js#ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
</cfoutput>
