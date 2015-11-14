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
 * RoundIt will round any number to a specific decimal point.
 * Original UDF by Simon Horwith (shorwith@figleaf.com)
 * 
 * @param num 	 The number to be rounded. 
 * @param digits 	 The number of decimal places to round to. 
 * @return Returns a rounded number. 
 * @author Sierra Bufe (sierra@brighterfusion.com) 
 * @version 2, November 15, 2001 
 */
function RoundIt(num,digits) {
	var i = num;
	// multiply by 10 to the power of the number of digits to be preserved
	i = i * (10 ^ digits);
	// round off to an integer
	i = Round(i);
	// divide by 10 to the power of the number of digits to be preserved
	i = i / (10 ^ digits);
	// return the result
	return i;
}
</cfscript>