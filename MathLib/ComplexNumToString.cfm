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
 * Convert a stored complex number to a string in the form a + bi.
 * Note that this function uses complex numbers stored as structures by the ComplexNum() UDF also available in this library.
 * 
 * @param ComplexNumber 	 Structure containing complex number you want converted to a string. 
 * @return Returns a string 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 1, November 15, 2001 
 */
function ComplexNumToString(ComplexNumber) {
  if ( ComplexNumber.I LT 0 )
    return "#ComplexNumber.R# - #Abs(ComplexNumber.I)#i";
  else		
    return "#ComplexNumber.R# + #ComplexNumber.I#i";
}
</cfscript>