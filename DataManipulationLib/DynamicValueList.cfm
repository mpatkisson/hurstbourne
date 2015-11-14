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
 * Returns a value list from a dynamic column of a query.
 * 
 * @param query 	 The query to examine. (Required)
 * @param col 	 The column to return values for. (Required)
 * @param delim 	 Delimiter. Defaults to comma. (Optional)
 * @return Returns a list. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, August 14, 2002 
 */
function DynamicValueList(query,col) {
	var delim = ",";
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	return arrayToList(query[col],delim);
}
</cfscript>