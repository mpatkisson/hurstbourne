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
 * Convert a text with many lines into a html list.
 * 
 * @param text 	 Text to format. (Required)
 * @return Returns a string. 
 * @author Tony Monast (merkel_@hotmail.com) 
 * @version 1, May 10, 2005 
 */
function paragraphToList(text) { 
	var thelist = "";
	var i = 1;
	text = trim(text);
	for(i=1; i lte listLen(text,chr(13));i=i+1) thelist = thelist & "<li>" & ListGetAt(text,i,chr(13)) & "</li>";
	if(len(thelist) GT 0) {  
		thelist = "<ul>" & thelist & "</ul>";
		return thelist ;
	} else return "";
}
</cfscript>