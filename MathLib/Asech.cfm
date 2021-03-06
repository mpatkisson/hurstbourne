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
 * Returns the inverse hyperbolic secant of a value.
 * 
 * @param x 	 0 < x <= 1 
 * @return Returns a numeric value or string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, October 16, 2001 
 */
function Asech(x){
  if (x lte 0)
    return "undefined";
  else 
    if (x gt 1)
      return "undefined";
  else
    return Log((Sqr(-x*x+1)+1)/x);
}
</cfscript>