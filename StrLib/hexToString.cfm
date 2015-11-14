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
 * Converts a hex value to a string.
 * 
 * @param hex 	 Hex string. (Required)
 * @return Returns a string. 
 * @author Michael Krock (michael.krock@avv.com) 
 * @version 1, January 28, 2004 
 */
function hexToString(hex) {
	
	var str = "";
	var i = 0;
		
	for (i=1; i LTE len(hex); i=i+2) {
		str = str & chr(inputBaseN(mid(hex,i,2),16));
	}
		
	return str;
}
</cfscript>