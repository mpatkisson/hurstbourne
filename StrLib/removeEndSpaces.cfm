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
 * strips all graph characters (spaces, tabs, line breaks) off the end of a string.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Nick Giovanni (ngiovanni@gmail.com) 
 * @version 2, March 6, 2010 
 */
function removeEndSpaces(str) {
	return reReplace(str,"\s*$","","all");
 }
</cfscript>