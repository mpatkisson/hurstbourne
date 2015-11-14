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
 * Generates an (IPv4) Internet Protocol dotted address (aaa.bbb.ccc.ddd) from the proper address representation.
 * 
 * @param longip 	 Numeric version of IP address. (Required)
 * @return Returns the IP as a string. 
 * @author Troy Pullis (tpullis@yahoo.com) 
 * @version 0, January 9, 2009 
 */
function long2ip(longip) {
	var ip = "";
	var i = "";
    if (longip < 0 || longip > 4294967295) 
		return 0;
    for (i=3;i>=0;i--) {
        ip = ip & int(longip / 256^i);
        longip = longip - int(longip / 256^i) * 256^i;
        if (i>0) 
			ip = ip & ".";
    }
    return ip;
}
</cfscript>