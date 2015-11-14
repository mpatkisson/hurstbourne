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
 * Prepends a string to every item in a list.
 * Version 2 by Raymond Camden
 * 
 * @param list 	 List to modify. (Required)
 * @param string 	 String to prepend. (Required)
 * @param delim 	 Delimiter. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author SHUM Ting-hin (gene_shum@iclp.com.hk) 
 * @version 2, September 21, 2004 
 */
function listElementPrepend(list,string) {
	var delim = ",";
	var i = "";
	
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	
	for(i=1; i lte listLen(list); i=i+1) {
		list = listSetAt(list, i, string & listGetAt(list,i));
	}
	
	return list;
}
</cfscript>