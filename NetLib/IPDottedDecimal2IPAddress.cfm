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
 * Converts a 32-bit dotted decimal IP number to an IP address.
 * 
 * @param ipValue 	 Dotted decimal value of IP address. (Required)
 * @return Returns a string. 
 * @author Jonathan Pickard (j_pickard@hotmail.com) 
 * @version 1, September 27, 2002 
 */
function IPDottedDecimal2IPAddress( ipvalue ) {
	var ipAddress = "";
	var lBitMasks = "24,16,8,0";
	var i = 1;

	for ( ; i LTE 4; i = i + 1 )
	{
		ipAddress = ipAddress & "." & BitMaskRead( ipvalue, ListGetAt( lBitMasks, i ), 8 );
	}
	ipAddress = Right( ipAddress, Len( ipAddress ) - 1 );

	return ipAddress;
}
</cfscript>