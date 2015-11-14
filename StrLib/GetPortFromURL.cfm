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
 * Returns the port number from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, February 21, 2002 
 */
function GetPortFromURL(this_url) {
	var re_found_struct = "";
	
	this_url = trim(this_url);
	
	re_found_struct = REFind("[^./].[^./:]+(:[[:digit:]]+)", this_url, 1, "True");

	if (re_found_struct.pos[1] GT 0) {
		return Mid(this_url, re_found_struct.pos[2]+1, re_found_struct.len[2]-1);
	} else {
		return "";
	}
}
</cfscript>