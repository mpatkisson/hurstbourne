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
 * Returns the two real roots of a polynomial in the form: ax^2 + bx + c = 0
 * 
 * @param a 	 Coefficient of x^2 term 
 * @param b 	 Coefficient of x term 
 * @param c 	 Constant 
 * @return Returns a structure. 
 * @author Joel Cox (jlcox@goodyear.com) 
 * @version 1, July 18, 2001 
 */
function Quadratic(a, b, c)
{
  Var mRoots = StructNew();
  Var first = 0;
  Var second = 0;
  Var denom = 2 * a;
  Var arg1 = b^2 - 4 * a * c;
  if (arg1 LT 0) {
    mRoots["Root1"] = "not real";
  	mRoots["Root2"] = "not real";
  }
  else {   
  	first = -b / denom;
  	second = Sqr(arg1) / denom;
  	mRoots["Root1"] = first + second;
  	mRoots["Root2"] = first - second; 
  }
  Return mRoots;
}
</cfscript>