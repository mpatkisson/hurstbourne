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
 * Takes any three numbers, checks to see whether they create a right triangle.
 * Optimizations by Rob Brooks-Bilson (rbils@amkor.com) and Sierra Bufe (sierra@brighterfusion.com)
 * 
 * @param x 	 Length of one side of the triangle. 
 * @param y 	 Length of the second side of the triangle. 
 * @param z 	 Length of the third side of the triangle. 
 * @return Returns a Boolean value. 
 * @author Joshua Kay (josh@dataquix.com) 
 * @version 1, December 7, 2001 
 */
function isRightTriangle(x,y,z){
  // Sort the side lengths from smallest to largest
  ArraySort(Arguments,"Numeric");
  // Use the familiar Pythagorian theorem (a^2+B^2=C^2) to determine if this is a right triangle
  Return (Arguments[1]^2 + Arguments[2]^2) EQ Arguments[3]^2;
}
</cfscript>