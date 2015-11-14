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
 * A function that will strip out all anchors in text that has been passed as an argument.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 String to strip anchors from. (Required)
 * @return Returns a string. 
 * @author Brian Brown (vonbrownz@hotmail.com) 
 * @version 2, November 1, 2002 
 */
function stripAnchors(str) {
	var temp = reReplaceNoCase(str,"<[[:space:]]*a[[:space:]]+[^>]*>","","all");
	return reReplaceNoCase(temp,"<[[:space:]]*/a[[:space:]]*>","","all");
}
</cfscript>