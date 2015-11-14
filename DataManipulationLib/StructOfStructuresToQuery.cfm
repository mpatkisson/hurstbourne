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
 * Converts a structure of structures to a CF Query.
 * 
 * @param theStruct 	 The structure to translate. (Required)
 * @param primaryKey 	 The query column name to use for the primary key. (Required)
 * @return Returns a query. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 28, 2002 
 */
function StructOfStructuresToQuery(theStruct, primaryKey){
	var primary_key_list   = StructKeyList(theStruct);
	var field_list         = StructKeyList(theStruct[ListFirst(primary_key_list)]);
	var num_rows           = ListLen(primary_key_list);
	var the_query          = QueryNew(primaryKey & "," & field_list);
	var primary_key_value  = "";
	var field_name         = "";
	var the_value          = "";
	var row                = 0;
	var col                = 0;

	for(row=1; row LTE num_rows; row=row+1) {
		QueryAddRow(the_query);
		primary_key_value = ListGetAt(primary_key_list, row);
		QuerySetCell(the_query, primaryKey, primary_key_value);
		for(col=1; col LTE ListLen(field_list); col=col+1) {
			field_name = ListGetAt(field_list, col);
			the_value  = theStruct[primary_key_value][field_name];
			QuerySetCell(the_query, field_name, the_value);
		}
	}

	return(the_query);
}
</cfscript>