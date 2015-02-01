<cfsilent>
	<cfset rc.nav = ''>
	<cfif getSection() is 'admin'>
		<cfdirectory directory="#ExpandPath('/views/admin/')#" action="list" listInfo="name" name="dirList" type="file">
		<cfloop query="dirList">
			<cfif FindOneOf('_', name) NEQ 1>
				<cfset rc.nav = ListAppend(rc.nav, name)>
			</cfif>
		</cfloop>
	<cfelse>
		<cfdirectory directory="#ExpandPath('/views/')#" action="list" listInfo="name" name="dirList" type="dir">
		<cfloop query="dirList">
			<cfif FindOneOf('_', name) NEQ 1>
				<cfset rc.nav = ListAppend(rc.nav, name)>
			</cfif>
		</cfloop>
	</cfif>
	
	<cfset thisMeal = "Snacks only">
	<cfset serveMeal = "danger">
	<cfquery datasource="magsuite" name="getMeal">
		SELECT *
		FROM meals
		WHERE enabled = 1
	</cfquery>
	
	<cfif getMeal.recordCount GT 0>
		<cfset thisMeal = getMeal.mel_name>
		<cfset serveMeal = "success">
	</cfif>
		
</cfsilent>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="mobile-web-app-capable" content="yes">
    <title><cfif IsDefined('rc.title') AND rc.title NEQ ''><cfoutput>#rc.title#</cfoutput> | </cfif>MAGFest 13 Staff Suite</title>

    <!-- Bootstrap -->
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
		<!-- Font Awesome Icons -->
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- MAGSuite styles -->
		<link href="/assets/css/magsuite.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
	
  <body>
		<cfoutput>
		<nav class="navbar navbar-inverse" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<cfif getSection() is not 'badge_check'>
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##mainNav">
							<span class="sr-only">Toggle Navigation</span>
							<span class="fa fa-navicon"></span>
						</button>
					</cfif>
					<cfif getSection() is 'badge_check'>
						<button class="btn navbar-btn btn-#serveMeal#"><strong>#thisMeal#</strong></button>
					<cfelseif getSection() is 'admin'>
						<a class="navbar-brand" href="#buildUrl('admin')#">Staff Suite Admin Dashboard</a>
					<cfelse>
						<a class="navbar-brand" href="#buildUrl('')#">MAGFest 13 Staff Suite</a>
					</cfif>
				</div>
				
				<div class="collapse navbar-collapse" id="mainNav">
					<ul class="nav navbar-nav navbar-right">
					<cfif getSection() is 'admin'>
						<cfloop list="#rc.nav#" index="navItem">
							<cfif FindNoCase('_',navItem) neq 1>
								<cfset fName = ReplaceNoCase(navItem,'.cfm','','all')>
								<cfif fName is not 'default'>
									<cffile action="read" file="#ExpandPath('/views/admin/#navItem#')#" variable="fRead">
									<cfset varPos = FindNoCase('rc.title', fRead)>
									<cfif varPos GT 0>
										<cfset srchPos = FindOneOf('"', fRead, varPos)>
										<cfset pgTitle = RemoveChars(fRead, 1, srchPos)>
										<cfset srchPos = FindOneOf('"', pgTitle)>
										<cfset pgTitle = RemoveChars(pgTitle, srchPos, Len(fRead))>
									</cfif>
									
									<cfset thisClass = ''>
									<cfif fName EQ getItem>
										<cfset thisClass = 'active'>
									</cfif>
									
									<li class="#thisClass#">
										<a href="#buildUrl('admin/#fName#')#">#pgTitle#</a>
									</li>
								</cfif>
							</cfif>
						</cfloop>
					<cfelseif getSection() is not 'badge_check'>
						<cfloop list="#rc.nav#" index="navItem">
							<cfif navItem is not 'admin' AND navItem is not 'badge_check'>
								<cfif navItem is 'main'>
									<cfset navTitle = 'Home'>
								<cfelse>
									<cfset navTitle = reReplace(lCase(navItem),'\b([a-z])','\U\1','all')>
								</cfif>
								
								<cfset subnav = ''>
								<cfdirectory directory="#ExpandPath('/views/#navItem#/')#" action="list" listInfo="name" name="fileList" type="file">
								
								<cfloop query="fileList">
									<cfif FindNoCase('_',name) neq 1>
										<cfset fName = ReplaceNoCase(name,'.cfm','','all')>
										<cffile action="read" file="#ExpandPath('/views/#navItem#/#name#')#" variable="fRead">
										<cfset varPos = FindNoCase('rc.title', fRead)>
										<cfif varPos GT 0>
											<cfset srchPos = FindOneOf('"', fRead, varPos)>
											<cfset pgTitle = RemoveChars(fRead, 1, srchPos)>
											<cfset srchPos = FindOneOf('"', pgTitle)>
											<cfset pgTitle = RemoveChars(pgTitle, srchPos, Len(fRead))>
											<cfset subnav = ListAppend(subnav, '#navItem#.#fName#,#pgTitle#', '|')>
										</cfif>
									</cfif>
								</cfloop>
								
								<cfset thisClass = ''>
								<cfif navItem EQ getSection()>
									<cfset thisClass = listAppend(thisClass, 'active', ' ')>
								</cfif>
								<cfif ListLen(subnav, '|') GT 1>
									<cfset thisClass = listAppend(thisClass, 'dropdown', ' ')>
								</cfif>
								
								<li class="#thisClass#">
								<cfif ListLen(subnav, '|') GT 1>
									<a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">#navTitle# <span class="fa fa-caret-down"></span></a>
									<ul class="dropdown-menu" role="menu">
									<cfloop list="#subnav#" index="subItem" delimiters="|">
										<cfset subNavLink = ListFirst(subItem)>
										<cfset subNavTitle = ListLast(subItem)>
										<li><a href="#buildUrl('#subNavLink#')#">#subNavTitle#</a></li>
									</cfloop>
									</ul>
								<cfelse>
									<a href="#buildUrl('#navItem#')#">#navTitle#</a>
								</cfif>
								</li>
							</cfif>
						</cfloop>
					</cfif>
					</ul>
				</div>
			</div>
		</nav>

		<div class="container" id="content">
			<!--- Body Content --->
				#body#
		</div>
		</cfoutput>
		
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/assets/js/bootstrap.min.js"></script>
  
	
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-54273067-1', 'auto');
  ga('send', 'pageview');

</script>	
	</body>
</html>