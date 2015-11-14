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
 * Allows changing of a query cell by knowing a key field value within the same row.
 * 
 * @param theQuery 	 The query to modify. (Required)
 * @param keyField 	 The column to search against. (Required)
 * @param keyFieldValue 	 The value to search for. (Required)
 * @param columnName 	 The column to modify. (Required)
 * @param newValue 	 The value to set. (Required)
 * @return Returns a query. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 28, 2002 
 */
function QuerySetCellByKey(theQuery, keyField, keyFieldValue, columnName, newValue){
	var key_field_value_list  = Evaluate("ValueList(theQuery.#keyField#)");
	var row_number            = ListFindNoCase(key_field_value_list, keyFieldValue);
	querysetCell(theQuery,columnName,newValue,row_number);
}
</cfscript>