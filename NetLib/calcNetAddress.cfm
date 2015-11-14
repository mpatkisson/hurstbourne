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
 * calculate a network address from an IP address and a (sub)Netmask.
 * 
 * @param myIP 	 IP Address. (Required)
 * @param myNetMask 	 Netmask. (Required)
 * @return Returns an IP address (string). 
 * @author Tanguy Rademakers (t@newmediatwins.net) 
 * @version 1, May 12, 2003 
 */
function calcNetAddress (myIP, myNetMask) {
	var NetAddress = "";
	var i = 1;
	
	for (i = 1; i lte 4; i = i + 1) {
		NetAddress = ListAppend(NetAddress, BitAnd(ListGetAt(myIP,i,'.'),ListGetAt(myNetMask,i,'.')) ,'.'); 
	}
	return NetAddress;
}
</cfscript>