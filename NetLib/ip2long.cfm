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
 * Converts a string containing an (IPv4) Internet Protocol dotted address (aaa.bbb.ccc.ddd) into a proper address representation.
 * 
 * @param ip 	 IP address as string. (Required)
 * @return Returns a number. 
 * @author Troy Pullis (tpullis@yahoo.com) 
 * @version 0, January 9, 2009 
 */
function ip2long(ip) {
	var iparr = ListToArray(ip,".");
	if (ArrayLen(iparr) != 4)
		return 0;
	else 
	 	return iparr[1]*256^3 + iparr[2]*256^2 + iparr[3]*256 + iparr[4];
}
</cfscript>