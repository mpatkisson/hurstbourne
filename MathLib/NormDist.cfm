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
 * Calculates the normal distribution for a given mean and standard deviation with cumulative=true
 * 
 * @param x 	 Value to compute the cumulative normal distribution for. (Required)
 * @param mean 	 Mean value. (Required)
 * @param sd 	 Standard deviation. (Required)
 * @return Returns a number. 
 * @author Rob Ingram (rob.ingram@broadband.co.uk) 
 * @version 1, June 14, 2003 
 */
function NormDist(x, mean, sd) {
    var res = 0.0;
    var x2 = 0.0;
    var oor2pi = 0.0;
    var t = 0.0;
	
    x2 = (x - mean) / sd;
    if (x2 eq 0) res = 0.5;
    else
    {
        oor2pi = 1/(sqr(2.0 * 3.14159265358979323846));
        t = 1 / (1.0 + 0.2316419 * abs(x2));
        t = t * oor2pi * exp(-0.5 * x2 * x2) 
             * (0.31938153   + t 
             * (-0.356563782 + t
             * (1.781477937  + t 
             * (-1.821255978 + t * 1.330274429))));
        if (x2 gte 0)
        {
            res = 1.0 - t;
        }
        else
        {
            res = t;
        }
    }
    return res;
}
</cfscript>