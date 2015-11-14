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
 * Function that determines which scope an unscoped variable refers to.
 * 
 * @param localVar 	 Variable name to check. (Required)
 * @return Returns a string. 
 * @author Mosh Teitelbaum (mosh.teitelbaum@evoch.com) 
 * @version 1, August 6, 2004 
 */
function getVariableScope(locVar) {
	var scopeList = "VARIABLES,CGI,FILE,URL,FORM,COOKIE,CLIENT,APPLICATION,SESSION,SERVER,REQUEST,CFHTTP,CALLER,ATTRIBUTES,ERROR,CFCATCH,CFFTP";
	var listEle = "";
	var cnt = 1;

	while (cnt LTE ListLen(scopeList)) {
		// Get current list element
		listEle = ListGetAt(scopeList, cnt);

		// Check for existence within current scope.  CGI is a special case
		if (listEle is "CGI" AND structKeyExists(cgi, locVar)) {
				return listEle;
		} else if (not listEle is "CGI" AND IsDefined("#listEle#.#locVar#")) {
				return listEle;
		}

		// Increment counter
		cnt = cnt + 1;
	}

}
</cfscript>