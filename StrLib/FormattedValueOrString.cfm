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
 * Returns either a formatted value or the passed default string.
 * 
 * @param begin_str 	 String to prepend to output. (Required)
 * @param str 	 Variable to check. (Required)
 * @param end_str 	 String to append to output. (Required)
 * @param default_str 	 String to return if  str is empty. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function FormattedValueOrString(begin_str, str, end_str, default_str) {
	if (str IS "") return default_str;
	return begin_str & str & end_str;
}
</cfscript>