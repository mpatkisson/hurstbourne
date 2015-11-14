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
 * Generate random colors for cfcharts!
 * 
 * @param numToReturn 	 Number of colors to return. (Required)
 * @return Returns a string. 
 * @author Pablo Varando (webmaster@easycfm.com) 
 * @version 0, June 12, 2009 
 */
function returnRandomHEXColors(numToReturn) {
	var returnList = ""; // define a clear var to return in the end with a list of colors
	var colorTable = "A,B,C,D,E,F,0,1,2,3,4,5,6,7,8,9"; // define all possible characters in hex colors
	var i = "";
	var tRandomColor = "";
	// loop through and generate as many colors as defined by the request
	for (i=1; i LTE val(numToReturn); i=i+1){
		// clear the color list
		tRandomColor = "";
		for(c=1; c lte 6; c=c+1){
			// generate a random (6) character hex code
			tRandomColor = tRandomColor & listGetAt(colorTable, randRange(1, listLen(colorTable)));
		}
		// append it to the list to return in the end
		returnList = listAppend(returnList, tRandomColor);
	
	}
	// return the list of random colors
	return returnList;
}
</cfscript>