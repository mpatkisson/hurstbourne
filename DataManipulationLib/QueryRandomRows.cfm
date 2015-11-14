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
 * Returns specified number of random records.
 * 
 * @param theQuery 	 The query to return random records from. (Required)
 * @param NumberOfRows 	 The number of random records to return. (Required)
 * @return Returns a query. 
 * @author Shawn Seley and John King (shawnse@aol.com) 
 * @version 1, July 10, 2002 
 */
function QueryRandomRows(theQuery, NumberOfRows) {
	var FinalQuery      = QueryNew(theQuery.ColumnList);
	var x				= 0;
	var y               = 0;
	var i               = 0;
	var random_element  = 0;
	var random_row      = 0;
	var row_list        = "";

	if(NumberOfRows GT theQuery.recordcount) NumberOfRows = theQuery.recordcount;

	QueryAddRow(FinalQuery, NumberOfRows);

	// build a list of rows from which we will "scratch off" the randomly selected values in order to avoid repeats
	for (i=1; i LTE theQuery.RecordCount; i=i+1) row_list = row_list & i & ",";

	// Build the new query
	for(x=1; x LTE NumberOfRows; x=x+1){
		// pick a random_row from row_list and delete that element from row_list (to prevent duplicates)
		random_element  = RandRange(1, ListLen(row_list));          // pick a random list element
		random_row      = ListGetAt(row_list, random_element);      // get the corresponding query row number
		row_list        = ListDeleteAt(row_list, random_element);   // delete the used element from the list
		for(y=1; y LTE ListLen(theQuery.ColumnList); y=y+1) {
			QuerySetCell(FinalQuery, ListGetAt(theQuery.ColumnList, y), theQuery[ListGetAt(theQuery.ColumnList, y)][random_row],x);
		}
	}

	return FinalQuery;
}
</cfscript>