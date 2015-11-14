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
 * Returns a rich text format unicode string, suitable for keyword replacement in rtf documents.
 * 
 * @param str 	 String to format. (Required)
 * @return Returns a string. 
 * @author Sierra Bufe (sierra@brighterfusion.com) 
 * @version 1, September 1, 2005 
 */
function richTextUnicodeFormat(str) {
	var u = "";
	var i = 1;
	var ch = "";
	
	for (;i lte Len(str);i=i+1) {
		ch = Mid(str, i, 1);
		u = u & "\u" & Asc(ch) & " ~";
	}
	return u;
}
</cfscript>