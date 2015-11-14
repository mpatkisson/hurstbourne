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
 * Compares a date/time string and validates it against the RFC 3339 - Date and Time on the Internet: Timestamps protocol.
 * 
 * @param input 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Ben Garrett (bengarrett@civbox.org) 
 * @version 1, February 8, 2010 
 */
function isRFC3339(input) {
	return YesNoFormat(REFindNoCase('^(19|20)\d\d-(0[1-9]|1[0-2])-([0-2]\d|3[0-1])T([0-1]\d|2[0-4]):([0-5]\d):([0-5]\d)(.\d\d)?(Z|[\+|-]([0-1]\d|2[0-4]):([0-5]\d))$',input));
}
</cfscript>