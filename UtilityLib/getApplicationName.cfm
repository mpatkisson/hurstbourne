<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * returns the name of the cfapplication.
 * 
 * @return Returns a string. 
 * @author Steven Maglio (smaglio@graddiv.ucsb.edu) 
 * @version 1, September 16, 2005 
 */
function getApplicationName() {
	var name = "";
	var appScopeTracker = createObject("java", "coldfusion.runtime.ApplicationScopeTracker");
	var keys = appScopeTracker.getApplicationKeys();
	var app = 0;
	var appName = 0;
	
	while(keys.hasNext()) {
		appName = keys.next();
		app = appScopeTracker.getApplicationScope(appName);
		if(app.equals( application ) ) return app.getName();
	}
	return "";
}
</cfscript>