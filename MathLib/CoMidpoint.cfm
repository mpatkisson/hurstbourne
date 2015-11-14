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
 * Returns the coordinates of the midpoint between two points on a line.
 * 
 * @param x1 	 x position of the first point 
 * @param y1 	 y position of the first point 
 * @param x2 	 x position of the second point 
 * @param y2 	 y position of the second point 
 * @return Returns a string 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 17, 2001 
 */
function CoMidpoint(x1,y1,x2,y2)
{
  Return (x1+x2)/2 & ',' & (y1+y2)/2;
}
</cfscript>