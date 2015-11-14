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
 * Counterpart to HexToString - converts an ASCII string to hexadecimal.
 * 
 * @param str 	 String to convert to hex. (Required)
 * @return Returns a string. 
 * @author Chris Dary (umbrae@gmail.com) 
 * @version 1, May 8, 2006 
 */
function stringToHex(str) {
	var hex = "";
	var i = 0;
	for(i=1;i lte len(str);i=i+1) {
		hex = hex & right("0" & formatBaseN(asc(mid(str,i,1)),16),2);
	}
	return hex;
}
</cfscript>