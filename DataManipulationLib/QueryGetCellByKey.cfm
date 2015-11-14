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
 * Provides direct access to query cells by knowing a key field value within the same row.
 * 
 * @param theQuery 	 The query to search. (Required)
 * @param keyField 	 The column value to return. (Required)
 * @param keyFieldValue 	 The value to search for in keyFIeld. (Required)
 * @param columnName 	 The column value to return. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 28, 2002 
 */
function QueryGetCellByKey(theQuery, keyField, keyFieldValue, columnName){
	var key_field_value_list  = Evaluate("ValueList(theQuery.#keyField#)");
	var row_number            = ListFindNoCase(key_field_value_list, keyFieldValue);

	return theQuery[columnName][row_number];

}
</cfscript>