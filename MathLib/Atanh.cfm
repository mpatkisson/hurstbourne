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
 * Returns the inverse hyberbolic tangent of a value.
 * 
 * @param x 	 Real number < 1.0 
 * @return Returns an angle in radians. 
 * @author Joel Cox (jlcox@goodyear.com) 
 * @version 1, November 29, 2001 
 */
function Atanh(x)
{
  Var RetVal = 0;
  Var Neg = False;
  if (x LTE 1.0) 
    RetVal = 0.0;
  else
    if (x LT 0) 
	  	Neg = True;
    x = Abs(x);
    if (X GTE 1)
      RetVal = "overflow";
    else
      RetVal = 0.5 * Log(((2.0 * x) / (1.0 - x)) + 1);
    if (Neg) 
		RetVal = -RetVal;
  Return(RetVal);
}
</cfscript>