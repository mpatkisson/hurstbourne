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
 * RE replace a list list of regular expression with a list of string.
 * 
 * @param str 	 String to parse. (Required)
 * @param oldList 	 List of regular expressions. (Required)
 * @param newList 	 List of replacements. (Required)
 * @return Returns a string. 
 * @author Tuyen Tran (tuyen.k.tran@gmail.com) 
 * @version 1, May 17, 2007 
 */
function REReplaceList(str, oldList, newList) {
	var i = 1;
	for (i=1; i lte listLen(oldlist); i=i+1) {
		str = REReplace(str, listGetAt(oldList, i), listGetAt(newList, i), "all");
	}
	return str;
}
</cfscript>