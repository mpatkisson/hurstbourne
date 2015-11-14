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
 * Takes a selected column of data from a query and converts it into an array.
 * 
 * @param query 	 The query to scan. (Required)
 * @param column 	 The name of the column to return data from. (Required)
 * @return Returns an array. 
 * @author Peter J. Farrell (pjf@maestropublishing.com) 
 * @version 1, July 22, 2005 
 */
function queryColumnToArray(qry, column) {
	var arr = arrayNew(1);
	var ii = "";
	var loop_len = arguments.qry.recordcount;
	for (ii=1; ii lte loop_len; ii=ii+1) {
		arrayAppend(arr, arguments.qry[arguments.column][ii]);
	} 
	return arr;
}
</cfscript>