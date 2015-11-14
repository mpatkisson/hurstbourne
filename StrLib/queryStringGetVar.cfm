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
 * Gets the value of a variable in a query string.
 * 
 * @param query_string 	 The query string to examine. (Required)
 * @param this_var_name 	 The variable to look for. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@hotmail.com) 
 * @version 1, August 1, 2005 
 */
function queryStringGetVar(querystring, this_var_name){
	var re_found_struct = "";
	querystring = trim(querystring);
	
	re_found_struct = REFindNoCase("(^|[\?|&])#this_var_name#=([^\&]*)", querystring, 1, "true");
	// = re_found_struct.len & re_found_struct.pos
	
	if(arrayLen(re_found_struct.pos) gte 3) {
		if (re_found_struct.pos[3] GT 0) return urlDecode(mid(querystring, re_found_struct.pos[3], re_found_struct.len[3]));
		else return "";
	} else return "";
}
</cfscript>