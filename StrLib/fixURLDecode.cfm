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
 * This is a workaround for the URLDecode bug that exists in CF5 and CFMX.
 * 
 * @param string 	 String to url decode. (Required)
 * @return Returns a string. 
 * @author Anthony Petruzzi (tonyp@rolist.com) 
 * @version 1, September 23, 2004 
 */
function fixURLDecode(string){
	return URLDecode(ReReplaceNoCase(string, "%([^A-F0-9{2}])", "%25\1", "ALL"));
}
</cfscript>