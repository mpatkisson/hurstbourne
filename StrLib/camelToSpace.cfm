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
 * Breaks a camelCased string into separate words
 * 8-mar-2010 added option to capitalize parsed words Brian Meloche brianmeloche@gmail.com
 * 
 * @param str 	 String to use (Required)
 * @param capitalize 	 Boolean to return capitalized words (Optional)
 * @return Returns a string 
 * @author Richard (acdhirr@trilobiet.nl) 
 * @version 0, March 8, 2010 
 */
function camelToSpace(str) {
	var rtnStr=lcase(reReplace(arguments.str,"([A-Z])([a-z])","&nbsp;\1\2","ALL"));
	if (arrayLen(arguments) GT 1 AND arguments[2] EQ true) {
		rtnStr=reReplace(arguments.str,"([a-z])([A-Z])","\1&nbsp;\2","ALL");
		rtnStr=uCase(left(rtnStr,1)) & right(rtnStr,len(rtnStr)-1);
	}
return trim(rtnStr);
}
</cfscript>