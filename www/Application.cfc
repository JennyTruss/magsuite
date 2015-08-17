component extends="framework.one" {
	this.name = 'MAGClassic2015';
	this.showdebugoutput = false;
	this.sessionManagement = true;
	//this.sessionTimeout = CreateTimeSpan(0, 1, 0, 0); // One hour Session Timeout

	this.ormenabled = true;
	this.datasource = 'magclassic';
	this.ormsettings = {
		flushAtRequestEnd = 'false',
		cfclocation = '/model/data',
		logsql = 'false',
		dbcreate = 'update',
		dialect = 'MySQL'
	};

	variables.framework = {
		generateSES = true,
		SESOmitIndex = true
	};
	
	function setupApplication(){
		application.timestamp = dateTimeFormat(now(),"yyyymmddHHnnss");
		application.root = '/';
		application.assets = application.root & 'assets/';
		application.images = application.assets & 'images/';
		application.css = application.assets & 'css/';
		application.js = application.assets & 'js/';
	}

	function setupRequest() {
		// use setupRequest to do initialization per request
		request.context.startTime = getTickCount();
	}

}
