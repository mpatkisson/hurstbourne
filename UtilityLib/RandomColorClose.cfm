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
 * Returns a random color close to your given color.
 * 
 * @param color 	 RGB color, minus the #. (Required)
 * @param closeness 	 How close the random color should be to the original. (Required)
 * @return Returns a RGB color in the form of a string. 
 * @author nathan (nathans@dnsfirm.com) 
 * @version 1, June 12, 2003 
 */
function randomColorClose(color,closeness) {
	var redColor = "";
	var greenColor = "";
	var blueColor = "";

	redColor = InputBaseN(Mid(color,1,2),16);
	greenColor = InputBaseN(Mid(color,3,2),16);
	blueColor = InputBaseN(Mid(color,5,2),16);

	// randomize and format back to base 16. min and max functions ensure characters don't leave base 16 size.
	redColor = FormatBaseN(Min(255,Max(0,RandRange(redColor-closeness,redColor+closeness))),16);
	greenColor = FormatBaseN(Min(255,Max(0,RandRange(greenColor-closeness,greenColor+closeness))),16);
	blueColor = FormatBaseN(Min(255,Max(0,RandRange(blueColor-closeness,blueColor+closeness))),16);

	// fix formatting
	if(len(redColor) is 1) redColor = "0" & redColor;
	if(len(greenColor) is 1) greenColor = "0" & greenColor;
	if(len(blueColor) is 1) blueColor = "0" & blueColor;

	return "##" & redColor & greenColor & blueColor;
}
</cfscript>