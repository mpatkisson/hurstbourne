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
 * Cumulative Normal Distribution
 * 
 * @param x 	 value for which you want to compute the cumulative normal distribution (Required)
 * @return Returns a numeric value. 
 * @author Alex (axs@arbornet.org) 
 * @version 1, March 10, 2003 
 */
function CND (x) {
    // The cumulative normal distribution function
    var Pi = 3.141592653589793238;
    var a1 = 0.31938153;
    var a2 = -0.356563782;
    var a3 = 1.781477937;
    var a4 = -1.821255978;
    var a5 = 1.330274429;
    var L = abs(x);
    var k = 1 / ( 1 + 0.2316419 * L);
    var p = 1 - 1 /  ((2 * Pi)^0.5) * exp( -(L^2) / 2 ) * (a1 * k + a2 * (k^2) + a3 * (k^3) + a4 * (k^4) + a5 * (k^5) );

    if (x gte 0)
        return p;
    else
        return 1-p;

}
</cfscript>