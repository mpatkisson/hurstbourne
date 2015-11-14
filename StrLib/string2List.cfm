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
 * Converts a string to a list using the specified delimter (defaults to comma). Returns a list.
 * 
 * @param s 	 String to modify. (Required)
 * @param delim 	 Delimiter to use for new list. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, May 26, 2005 
 */
function string2List(s){
	var i=0;
	var l="";
	var delim=",";
	
	if(arrayLen(arguments) gt 2) delim = arguments[3];
	
	for(i=1;i lte Len(s);i=i+1) l = listAppend(l,mid(s,i,1),delim);

	return l;
}
</cfscript>