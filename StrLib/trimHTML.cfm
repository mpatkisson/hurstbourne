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
 * Like Trim() except it also works on html.
 * 
 * @param str 	 String to format. (Required)
 * @return Returns a string. 
 * @author Kenric L. Ashe (cflib.org@kenric.com) 
 * @version 1, November 14, 2007 
 */
function trimHTML(str) {
	var htmlList = "<p>,</p>,<br>,<br/>,<br />,&nbsp;";
	var x = 0; var H = ""; var looping = 1;
	while (looping) {
		looping = 0;
		str = Trim(str);
		for (x=1; x lte ListLen(htmlList); x=x+1) {
			H = ListGetAt(htmlList, x);
			if (Left(str, Len(H)) is H) {str = Right(str, Len(str) - Len(H)); looping = 1;}
			if (Right(str, Len(H)) is H) {str = Left(str, Len(str) - Len(H)); looping = 1;}
		}
	}
	return str;
}
</cfscript>