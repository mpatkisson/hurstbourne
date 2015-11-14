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
 * Function to take a single row from a query and generate a list.
 * 
 * @param query 	 The query to examine. (Required)
 * @param queryrow 	 Row to use. (Optional)
 * @param delim 	 Delimiter to use. (Optional)
 * @return Returns a string. 
 * @author Tim Sloan (tim@sloanconsulting.com) 
 * @version 1, August 6, 2004 
 */
function queryRowToList(query){
	var queryrow = 1;
	var j = 1;
	var querycols = listToArray(query.columnList);
	var delim = ",";
	var listReturn = "";
	if(arrayLen(arguments) GT 1) queryrow = arguments[2];
	if(arrayLen(arguments) GT 2) delim = arguments[3];
	for(j = 1; j lte arraylen(querycols); j = j + 1){
		listReturn = ListAppend(listReturn, query[querycols[j]][queryrow], delim);
	}		
	return listReturn;
}
</cfscript>