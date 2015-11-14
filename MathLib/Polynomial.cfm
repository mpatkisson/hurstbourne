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
 * Evaluates the Polynomial in the form y = an * x^n + a(n-1) * x^(n-1) + ... + a1 * x + a0 for a given value of x.
 * 
 * @param x 	 Any real value. 
 * @param a1 	 Real coefficient of highest power of x. 
 * @param a0 	 Real coefficient of second-highest power of x. 
 * @param a... 	 Additional coefficients. 
 * @return Returns a simple value. 
 * @author Joel Cox (jlcox@goodyear.com) 
 * @version 1.0, July 18, 2001 
 */
function Polynomial(x, a1, a0)
{ 
	var RetVal = a1 * x + a0;  
	var arg_count = ArrayLen(Arguments);
	var opt_arg = 4;
	for( ; opt_arg LTE arg_count; opt_arg = opt_arg + 1 )
	{
		RetVal = RetVal * x + Arguments[opt_arg];
	}
	return(RetVal); 
}
</cfscript>