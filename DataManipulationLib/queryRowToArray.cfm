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
 * queryRowToArray
 * version 0.1 by Paul Kukiel
 * version 1.0 by Adam Cameron - fixing bug wherein not all columns were returned, plus factoring out unsupported query method usage in favour of native CFML getMetadata() function call to get query columns
 * 
 * @param query 	 Query to extract from from (Required)
 * @param row 	 Which row to extract (Required)
 * @return Returns an array 
 * @author Paul Kukiel (kukielp@gmail.com) 
 * @version 1, July 27, 2012 
 */
function queryRowToArray(query, row){
	var i = 1;
	var queryCols = getMetadata(query);
	var arrayReturn = [];

	for(i = 1; i <= arrayLen(querycols); i++){
		arrayReturn[i] = query[querycols[i].name][arguments.row];
	}
	return arrayReturn;
}
</cfscript>