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
 * Emulates the preg_match function in PHP for returning a regex match along with any backreferences.
 * 
 * @param regex 	 Regular expression. (Required)
 * @param str 	 String to search. (Required)
 * @return Returns an array. 
 * @author Aaron Eisenberger (aaron@x-clothing.com) 
 * @version 1, February 15, 2004 
 */
function preg_match(regex,str) {
	var results = arraynew(1);
	var match = "";
	var x = 1;
	if (REFind(regex, str, 1)) { 
		match = REFind(regex, str, 1, TRUE); 
		for (x = 1; x lte arrayLen(match.pos); x = x + 1) {
			if(match.len[x])
				results[x] = mid(str, match.pos[x], match.len[x]);
			else
				results[x] = '';
		}
	}
	return results;
}
</cfscript>