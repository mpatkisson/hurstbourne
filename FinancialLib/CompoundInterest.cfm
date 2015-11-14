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
 * Calculate the compound interest after n years.
 * 
 * @param r 	 Interest rate (3% = 0.03). 
 * @param p 	 Principal 
 * @param t 	 Duration of the loan in years. 
 * @return Returns a numeric value. 
 * @author Stephan Scheele (stephan@stephan-t-scheele.de) 
 * @version 1, April 23, 2002 
 */
function compoundInterest(r, p, t){
  return (p* (1 + r)^t);
}
</cfscript>