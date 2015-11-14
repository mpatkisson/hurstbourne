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
 * determine if IP is with in a range.
 * 04-mar-2010 renamed to IPinRange so as not to conflict w/existing UDF
 * 
 * @param start 	 start IP range (Required)
 * @param end 	 end IP range (Required)
 * @param ip 	 IP to test if in range (Required)
 * @return Returns a boolean. 
 * @author A. Cole (acole76@NOSPAMgmail.com) 
 * @version 0, March 4, 2010 
 */
function isIpInRange(start, end, ip)
	{
		var startArray = listtoarray(arguments.start, ".");
		var endArray = listtoarray(arguments.end, ".");
		var ipArray = listtoarray(arguments.ip, ".");
		var s = ((16777216 * startArray[1]) + (65536 * startArray[2]) + (256 * startArray[3]) + startArray[4]);
		var e = ((16777216 * endArray[1]) + (65536 * endArray[2]) + (256 * endArray[3]) + endArray[4]);
		var c = ((16777216 * ipArray[1]) + (65536 * ipArray[2]) + (256 * ipArray[3]) + ipArray[4]);
		
		return isvalid("range", c, s, e);
	}
</cfscript>