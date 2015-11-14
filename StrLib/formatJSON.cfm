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
 * Formats a JSON string with indents &amp; new lines.
 * v1.0 by Ben Koshy
 * 
 * @param str 	 JSON string (Required)
 * @return Returns a string of indent-formated JSON 
 * @author Ben Koshy (cf@animex.com) 
 * @version 0, September 16, 2012 
 */
// formatJSON() :: formats and indents JSON string
// based on blog post @ http://ketanjetty.com/coldfusion/javascript/format-json/
// modified for CFScript By Ben Koshy @animexcom
// usage: result = formatJSON('STRING TO BE FORMATTED') OR result = formatJSON(StringVariableToFormat);

public string function formatJSON(str) {
	var fjson = '';
    var pos = 0;
    var strLen = len(arguments.str);
	var indentStr = chr(9); // Adjust Indent Token If you Like
    var newLine = chr(10); // Adjust New Line Token If you Like <BR>
	
	for (var i=1; i<strLen; i++) {
		var char = mid(arguments.str,i,1);
		
		if (char == '}' || char == ']') {
			fjson &= newLine;
			pos = pos - 1;
			
			for (var j=1; j<pos; j++) {
				fjson &= indentStr;
			}
		}
		
		fjson &= char;	
		
		if (char == '{' || char == '[' || char == ',') {
			fjson &= newLine;
			
			if (char == '{' || char == '[') {
				pos = pos + 1;
			}
			
			for (var k=1; k<pos; k++) {
				fjson &= indentStr;
			}
		}
	}
	
	return fjson;
}
</cfscript>