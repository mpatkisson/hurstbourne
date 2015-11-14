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
 * Parses an HTML page and returns the title.
 * 
 * @param str 	 The HTML string to check. 
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, December 3, 2001 
 */
function GetHTMLTitle(str) {
	var matchStruct = reFindNoCase("<[[:space:]]*title[[:space:]]*>([^<]*)<[[:space:]]*/title[[:space:]]*>",str,1,1);
	if(arrayLen(matchStruct.len) lt 2) { writeoutput("error<BR>");return ""; }
	return Mid(str,matchStruct.pos[2],matchStruct.len[2]);	
}
</cfscript>