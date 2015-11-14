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
 * Calculates the Grade of Service (failure rate) based on Busy Hour Traffic (Erlangs) and number of indepenedent lines
 * 
 * @param Erl 	 Busy Hour Traffic (BHT) or the number of hours of call traffic during the busiest hour of operation. (Required)
 * @param n 	 Number of independent lines available for traffic. Positive integer. (Required)
 * @return Returns a number. 
 * @author Alex Belfor (abelfor@yahoo.com) 
 * @version 1, February 14, 2004 
 */
function ErlangB(erl,n) {
	var s=1;
	var i=1;
	for (i=1; i LTE n; i=i+1) s=s*i/erl+1;
	return (1/s);
}
</cfscript>