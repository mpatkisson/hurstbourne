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
 * Calculates the area of a trapezoid.
 * 
 * @param base1 	 Length of the bottom base. 
 * @param base2 	 Length of the top base. 
 * @param height 	 Height of the trapezoid. 
 * @return Returns the area of the trapezoid. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 17, 2001 
 */
function AreaTrapezoid(base1, base2, height)
{
  Return (base1 + base2)/2 * height;
}
</cfscript>