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
 * Converts an IP address to a network class.
 * 
 * @param ip 	 IP address. (Required)
 * @return Returns a string. 
 * @author del usr (delusrexpert@hotmail.com) 
 * @version 1, February 14, 2004 
 */
function IPclass(ip) {
	var myint = listFirst(ip, ".");
	if (myint GTE 1 and myint LTE 127) return "Class A";
	if (myint GTE 128 and myint LTE 191) return "Class B";
	if (myint GTE 192 and myint LTE 223) return "Class C";
	if (myint GTE 224 and myint LTE 239) return "Class D";
	if (myint GTE 240 and myint LTE 255) return "Class E";
}
</cfscript>