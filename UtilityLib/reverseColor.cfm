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
 * Returns the opposite of a color.
 * 
 * @param startingColor 	 RGB value minus the #. (Required)
 * @return Returns a string. 
 * @author Matt Liotta (mliotta@r337.com) 
 * @version 1, November 18, 2003 
 */
function reverseColor(startingColor) {
	var start = InputBaseN(startingColor, 16);
	var red = InputBaseN("FF", 16);
	var green = InputBaseN("FF00", 16);
	var blue = InputBaseN("FF0000", 16);
	var tmp = "";

	invertRed = BitAnd(BitXOR(start, red), red);
	invertGreen = BitAnd(BitXOR(start, green), green);
	invertBlue = BitAnd(BitXOR(start, blue), blue);

	tmp = invertRed + invertGreen + invertBlue;
	tmp = Ucase(FormatBaseN(tmp, 16));
	if(len(tmp) is 4) tmp = "00" & tmp;

	return tmp;
}
</cfscript>