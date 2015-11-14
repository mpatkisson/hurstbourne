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
 * Determines if a point lies within a circle.
 * 
 * @param pointX 	 X value of point. (Required)
 * @param pointY 	 Y value of point. (Required)
 * @param circleX 	 X value of center of circle. (Required)
 * @param circleY 	 Y value of center of circle. (Required)
 * @param circleRadius 	 Radius of circle. (Required)
 * @return Returns a boolean. 
 * @author Keith Westcott (kaw4@york.ac.uk) 
 * @version 1, April 20, 2006 
 */
function isPointInCircle (pointX, pointY, circleX, circleY, circleRadius) {
	var dx = (circleX - pointX);
	var dy = (circleY - pointY);
	return (dx * dx + dy * dy) LTE circleRadius * circleRadius;
}
</cfscript>