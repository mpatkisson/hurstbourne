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
 * Returns a completely random color. Beautiful, isn't it?
 * Version 2 by Raymond Camden
 * 
 * @return Returns a string. 
 * @author Nathan Strutz (nathans@dnsfirm.com) 
 * @version 2, May 13, 2003 
 */
function randomColor() {
	var redColor = formatBaseN(randRange(0,255),16);
	var greenColor = formatBaseN(randRange(0,255),16);
	var blueColor = formatBaseN(randRange(0,255),16);
	
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;

	return "##" & redColor & greenColor & blueColor;
}
</cfscript>