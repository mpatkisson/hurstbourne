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
 * Returns the logarithm of a value to the specified base.
 * 
 * @param value 	 real number > 0. 
 * @param base 	 real number > 0. 
 * @return Returns a simpe value. 
 * @author Joel Cox (jlcox@goodyear.com) 
 * @version 1, October 9, 2001 
 */
function LogN(x, b)
{
  if (x GT 0)
  	Return(Log(x) / Log(b));
  else
  	Return("undefined");
}
</cfscript>