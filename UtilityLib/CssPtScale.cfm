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
 * CssPtScale increases the point size of text by one point for browsers other than Microsoft Internet Explorer.
 * 
 * @param size 	 Size to use. (Required)
 * @return Returns a number along with the string 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, December 23, 2002 
 */
function CssPtScale(size){
	if (http_user_agent DOES NOT CONTAIN "MSIE") return "#val(size+1)#pt";
	else return "#size#pt";
}
</cfscript>