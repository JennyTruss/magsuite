<cfscript>
    primaryColor = 'teal';
    secondaryColor = 'blue-grey';
</cfscript>
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
            <link rel="stylesheet" href="#application.css#roboto.min.css">
            <link rel="stylesheet" href="#application.css#material.min.css">
            <link rel="stylesheet" href="#application.css#material-fullpalette.css">
            <link rel="stylesheet" href="#application.css#ripples.min.css">
            <!-- Font-Awesome -->
            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
            <!-- MAGSuite styles -->
            <link rel="stylesheet" href="#application.css#magsuite.css">

            <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
                <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
                <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
            <![endif]-->
        </head>

        <body>
            <div id="background-block" class="well well-material-#secondaryColor#-100"></div>
            <div id="header-block" class="well well-material-#primaryColor#-900"></div>
            <div id="site-container">
                <div class="navbar navbar-material-#primaryColor#-900">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##header-nav" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="mdi-navigation-menu"></span>
                            </button>
                            <a class="navbar-brand" href="#buildUrl('')#">MAGFest Staff Suite</a>
                        </div>
                        <div class="collapse navbar-collapse" id="header-nav">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="#buildUrl('menu')#">MAGClassic 2015 Menu</a></li>
                                <li class="dropdown">
                                    <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Staff Suite Rules <span class="fa fa-chevron-down"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#buildUrl('rules')#">Visiting the Suite</a></li>
                                        <li><a href="#buildUrl('rules.volunteers')#">Working in the Suite</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="container">
                    <div class="well">
                        #body#
    
                        
                        <h2>Questions</h2>
                        <p>If there are any questions regarding the menu or rules, or you are interested in volunteering with the Staff Suite, please send an email to <a href="mailto:chefs@magfest.org">chefs@magfest.org</a></p>
                    </div>
                </div>
            </div>

            <!-- Bootstrap core JavaScript
            ================================================== -->
            <!-- Placed at the end of the document so the pages load faster -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="#application.js#bootstrap.min.js"></script>
            <script src="#application.js#ripples.min.js"></script>
            <script src="#application.js#material.min.js"></script>
            <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
            <script src="#application.js#ie10-viewport-bug-workaround.js"></script>
            <script>
                $(document).ready(function() {
                    $.material.init();
                });
            </script>
        </body>
    </html>
</cfoutput>
