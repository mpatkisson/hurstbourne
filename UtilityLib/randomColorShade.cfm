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
 * Returns a random color of a specified shade, light, dark, extra light, extra dark, or any.
 * 
 * @param contrast 	 A contract. Possible values are any (default), dark, exdark, light, exlight. (Optional)
 * @return Returns a string. 
 * @author Nathan Strutz (nathans@dnsfirm.com) 
 * @version 1, October 20, 2003 
 */
function randomColorShade() {
	var contrast = "any";
	var ranges = structNew();
	var redColor = "";
	var greenColor = "";
	var blueColor = "";
	
	ranges.any = "0,255";
	ranges.dark= "0,119";
	ranges.exdark = "0,51";
	ranges.light = "136,255";
	ranges.exlight = "204,255";
	
	if(arrayLen(arguments) gte 1) contrast = arguments[1];	
	
	redColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	greenColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	blueColor = formatBaseN(randRange(listFirst(ranges[contrast]),listLast(ranges[contrast])),16);
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;
	
	return "##" & redColor & greenColor & blueColor;
}
</cfscript>