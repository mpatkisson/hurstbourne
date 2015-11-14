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
 * Converts IPs to integers and back for efficient database storage.
 * 
 * @param ip or numeric version 	 IP or numeric version of IP. (Required)
 * @return Returns either a number of an IP. 
 * @author Aaron Eisenberger (aaron@x-clothing.com) 
 * @version 1, August 28, 2003 
 */
function IPConvert(val) {
	var int = '';
	var ip = arraynew(1);
	if (find('.',val))
		{
		int = 0;
		int = ListGetAt(val, 1, ".") * 256^3;
		int = int + ListGetAt(val, 2, ".") * 256^2;
		int = int + ListGetAt(val, 3, ".") * 256;
		int = int + ListGetAt(val, 4, ".");
		return int;
		}
	else
		{
		int = val;
		ip[1] = Int(int / 256^3);
		int = int - (ip[1] * 256^3);
		ip[2] = int(int / 256^2);
		int = int - (ip[2] * 256^2);
		ip[3] = int(int / 256);
		ip[4] = int - (ip[3] * 256);
		ip = ip[1] & "." & ip[2] & "." & ip[3] & "." & ip[4];
		return ip;
		}
}
</cfscript>