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
 * Returns true if all characters in a string are numeric.
 * Version 2 by Raymond Camden
 * 
 * @param str 	 Value to check. (Required)
 * @return Returns a boolean. 
 * @author Tomas Becklin (tomasbecklin@gmail.com) 
 * @version 2, August 18, 2005 
 */
function isTrueNumeric(str) {
	return reFind("[^0-9]", str) is 0;
}
</cfscript>