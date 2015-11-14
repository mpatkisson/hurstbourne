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
 * Parses an HTML string and returns META tag information.
 * Regex fix for names with spaces by Johan Steenkamp (johan@orbital.co.nz).
 * Fix for self closing tags.
 * 
 * @param str 	 The string to check. (Required)
 * @return Returns an array. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 4, May 2, 2007 
 */
function GetMetaHeaders(str) {
	var matchStruct = structNew();
	var name = "";
	var content = "";
	var results = arrayNew(1);
	var pos = 1;
	var regex = "<meta[[:space:]]*(name|http-equiv)[[:space:]]*=[[:space:]]*(""|')([^""]*)(""|')[[:space:]]*content=(""|')([^""]*)(""|')[[:space:]]*/{0,1}>"; 	
	
	matchStruct = REFindNoCase(regex,str,pos,1);
	while(matchStruct.pos[1]) {
		results[arrayLen(results)+1] = structNew();
		results[arrayLen(results)][ Mid(str,matchStruct.pos[2],matchStruct.len[2])] = Mid(str,matchStruct.pos[4],matchStruct.len[4]);
		results[arrayLen(results)].content = Mid(str,matchStruct.pos[7],matchStruct.len[7]);
		pos = matchStruct.pos[6] + matchStruct.len[6] + 1;
		matchStruct = REFindNoCase(regex,str,pos,1);
	}
	return results;
}
</cfscript>