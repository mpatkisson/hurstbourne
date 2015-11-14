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
 * Removes duplicate rows from a query based on a key column.
 * Modded by Ray Camden to remove evaluate
 * 
 * @param theQuery 	 The query to dedupe. (Required)
 * @param keyColumn 	 Column name to check for duplicates. (Required)
 * @return Returns a query. 
 * @author Matthew Fusfield (matt@fus.net) 
 * @version 1, December 19, 2008 
 */
function QueryDeDupe(theQuery,keyColumn) {
	var checkList='';
	var newResult=QueryNew(theQuery.ColumnList);
	var keyvalue='';
	var q = 1;
	var x = "";
	
	// loop through each row of the source query
	for (;q LTE theQuery.RecordCount;q=q+1) {

		keyvalue = theQuery[keycolumn][q];
		// see if the primary key value has already been used
		if (NOT ListFind(checkList,keyvalue)) {
			
			/* this is not a duplicate, so add it to the list and copy
			   the row to the destination query */
			checkList=ListAppend(checklist,keyvalue);
			QueryAddRow(NewResult);
			
			// copy all columns from source to destination for this row
			for (x=1;x LTE ListLen(theQuery.ColumnList);x=x+1) {
				QuerySetCell(NewResult,ListGetAt(theQuery.ColumnList,x),theQuery[ListGetAt(theQuery.ColumnList,x)][q]);
			}
		}
	}
	return NewResult;
}
</cfscript>