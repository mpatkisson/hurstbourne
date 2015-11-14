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
 * Returns different colors if the number passed to it is even or odd.
 * Modified by RCamden
 * 
 * @param num 	 The number to check for even/oddness. 
 * @param evencolor 	 The color to use for even numbers. 
 * @param oddcolor 	 The color to use for odd numbers. 
 * @return Returns a string. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1.1, November 27, 2001 
 */
function EvenOddColor(num,evencolor,oddcolor) {
    return Arguments[(num mod 2 )+ 2];
}
</cfscript>