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
 * Replaces the last occurrence of a substring in a string
 * 
 * @param string 	 List to parse. (Required)
 * @param substring1 	 Substring to search for. (Required)
 * @param substring2 	 String to use for a replacement. (Required)
 * @return Returns a string. 
 * @author John Whish (john.whish@crisp-ebusiness.com) 
 * @version 0, June 11, 2009 
 */
function replaceLast(string, substring1, substring2) {
	return Reverse(Reverse(arguments.string).replaceFirst(Reverse(arguments.substring1),Reverse(arguments.substring2)));
}
</cfscript>