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
 * Indents all the lines of a string.
 * 
 * @param string 	 String to be modified. 
 * @param indentchar 	 Character to use for indenting. Defaults to tab character (Chr(9)). 
 * @param repeatcount 	 Positive integer to repeat indentchar. Defaults to 1. 
 * @return Returns a string. 
 * @author James Ang (james@vertexcs.com) 
 * @version 1, July 17, 2001 
 */
function Indent(str) {
	var chri = CHR(9); // indenting character. Defaults to horizontal tab
	var ncnt = 1; // strIndent = RepeatString(ichr, ncnt)
	var strcr = CHR(13);
	var strlf = CHR(10);
	var strcrlf = strcr & strlf;
	var strIndent = "";
	if (ArrayLen(Arguments) GT 1) {
		chri = Arguments[2];
		if (ArrayLen(Arguments) GT 2) {
			ncnt = Arguments[3];
		}
	}
	strIndent = RepeatString(chri, ncnt);
	return (strIndent & REReplace(str, "([#strcrlf#]+)([^#strcrlf#])", "\1#strIndent#\2", "ALL"));
}
</cfscript>