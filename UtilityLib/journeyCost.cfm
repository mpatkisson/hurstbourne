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
 * Calculates the cost of a car journey.
 * 
 * @param miles 	 Miles traveled. (Required)
 * @param mpg 	 Miles per gallon. (Required)
 * @param ppl 	 Price per liter. (Required)
 * @return Returns a number. 
 * @author Dave Hill (write2dave@gmx.co.uk) 
 * @version 1, October 8, 2010 
 */
function journeyCost(miles,mpg,ppl) {
	var litresInGallon = 4.54;
	var cost = ( miles / mpg ) * litresInGallon * ( ppl / 100 );
	return decimalFormat(cost);
}
</cfscript>