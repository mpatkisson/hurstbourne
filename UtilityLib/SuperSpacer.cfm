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
 * A UDF that will add a spacer gif image in a varity of formats to assist in page layout.
 * 
 * @param height 	 Height of spacer image. Defaults to 1. (Optional)
 * @param width 	 Width of spacer image. Defaults to 1. (Optional)
 * @param border 	 Border of spacer image. Defaults to 1. (Optional)
 * @param srcURL 	 Source of image. Defaults to s.gif. (Optional)
 * @param alt 	 Alt tag value. Defaults to an empty string. (Optional)
 * @return Returns a string. 
 * @author Dave Forrest (dmf67@yahoo.com) 
 * @version 1, September 30, 2005 
 */
function ss() {	
	var height	= 1;
	var width	= 1;
	var border	= 0;
	var srcURL	= "s.gif";
	var alt		= "";
	var outString = "";
	if(arrayLen(arguments) gte 1) height = arguments[1];
	if(arrayLen(arguments) gte 2) width  = arguments[2];
	if(arrayLen(arguments) gte 3) border = arguments[3];
	if(arrayLen(arguments) gte 4) srcURL = arguments[4];
	if(arrayLen(arguments) gte 5) alt    = arguments[5];
	outString = "<img src=""#srcURL#"" height=""#height#"" width=""#width#"" alt=""#alt#"" border=""#border#"">";
	return outString;
}
</cfscript>