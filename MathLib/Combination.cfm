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
 * Returns the Combination of n elements taken p at a time.
 * This funciton requires the Permutation() and Factorial() functions from this library.
 * 
 * @param n 	 Any non-negative integer 
 * @param p 	 any non-negative integer, <= n 
 * @return Returns a simple value 
 * @author Joel Cox (jlcox@goodyear.com) 
 * @version 1, July 18, 2001 
 */
function Combination(n,p)
{
  var RetVal = 0;
  if (p GT n) {
   RetVal = "undefined";
  }
  else
   RetVal = Permutation(n,p) / Factorial(p);  
  Return RetVal;
}
</cfscript>