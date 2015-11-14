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
 * Strips links and closing link tags from a string.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Jen Wright (jen@jenw.net) 
 * @version 2, August 11, 2005 
 */
function removeLinks(str) {
	str = reReplace(str, "<[[:space:]]*[aA].*?>(.*?)<[[:space:]]*/[[:space:]]*a[[:space:]]*>","\1","all");
	return str;	
}
</cfscript>