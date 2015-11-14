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
 * Returns the inverse hyberbolic sine of a value.
 * 
 * @param x 	 Any real number. 
 * @return Returns an angle in radians. 
 * @author Joel Cox (jlcox@goodyear.com) 
 * @version 1, November 29, 2001 
 */
function Asinh(x)
{
  Var RetVal = 0;
  Var Neg = False;
  if (x EQ 0) {
    RetVal = 0;
  }
  else {
    if (X LT 0) 
	  	Neg = True;
    x = Abs(x);
    if (x GT 1.0e10)
      RetVal = Log(2) + Log(X);
    else {
      RetVal = x^2;
      RetVal = Log(x + RetVal / (1 + Sqr(1 + RetVal)) + 1);
    }
    if (Neg) 
		RetVal = -RetVal;
  }
  Return(RetVal);
}
</cfscript>