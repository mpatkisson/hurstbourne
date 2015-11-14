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
 * IsFloat() determines if a number is a float or whole number. Returns true for float.
 * Version 2 by RCamden (ray@camdenfamily.com)
 * 
 * @param eInt 	 Number to check (Required)
 * @return Returns a boolean. 
 * @author Phillip Holmes (pholmes@mediares.com) 
 * @version 1, April 22, 2003 
 */
function isFloat(eInt) {
	return (find(".",eInt) gt 0) and isNumeric(eInt);
}
</cfscript>