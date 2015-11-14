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
 * Returns True if A is a factor of B.
 * 
 * @param a 	 Any non negitive integer greater than or equal to 1. 
 * @param b 	 Any non negitive integer greater than or equal to 1. 
 * @return Returns true or false. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 18, 2001 
 */
function IsFactor(a,b)
{
  if (Int(b/a) EQ b/a){
    Return True;
    }
  else { 
    Return False;
  }
}
</cfscript>