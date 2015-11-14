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
 * Applies simple evaluations to every cell in a query column.
 * 
 * @param query 	 Query object. (Required)
 * @param columnName 	 Column to be modified. (Required)
 * @param theEval 	 Evaluation to be performed. Use X to represent column data. (Required)
 * @return Returns a query. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, September 12, 2003 
 */
function ColumnLoop(query, columnName, theEval) {
	var row = 0;
	var x = "";
	var rec_count = query.recordCount;
	for(row=1; row LTE rec_count; row=row+1) {
		x = query[columnName][row];
		querySetCell(query,columnname,evaluate(theEval),row);
	}
	return query;
}
</cfscript>