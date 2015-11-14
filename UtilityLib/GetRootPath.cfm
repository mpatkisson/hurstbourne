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
 * Determines the root path of the application without hard-coding.
 * 
 * @return Returns a string. 
 * @author Billy Cravens (billy@architechx.com) 
 * @version 1, October 3, 2002 
 */
function GetRootPath() {
	var cNested = listLen(getBaseTemplatePath(),"\") - listLen(getCurrentTemplatePath(),"\");
	var	appRootDir = cgi.script_name;
	var i = 0;
	
	for (i=0;i lte cNested;i=incrementValue(i)) {
		appRootDir = listDeleteAt(appRootDir,listLen(appRootDir, "/"),"/");
	}
	appRootDir = appRootDir & "/";
	return appRootDir;
}
</cfscript>