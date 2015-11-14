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
 * Calculates a UPC-A check digit.
 * 
 * @param upc 	 11 digit UPC-A code (Required)
 * @return Returns a numeric value. 
 * @author Pete Jacoby (cf@subnova.net) 
 * @version 1, June 15, 2002 
 */
function UPCCheckDigit(upc){
var odd = 0;
var even = 0;
var total = 0;

if (NOT IsNumeric(upc) OR Len(upc) NEQ 11)
	return(-1);

for (i=1; i LT 12; i=i+1){
		if (i MOD 2)
			odd=odd+Mid(upc, i, 1);
		else
			even=even+Mid(upc, i, 1);
	}

total=(odd*3)+even;
total=total mod 10;

if (total eq 0)
	return 0;
else
	return(10-total);
}
</cfscript>