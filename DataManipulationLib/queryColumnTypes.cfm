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
 * Returns a list of query column data types.
 * 
 * @param dbquery 	 Query to analyze. (Required)
 * @return Returns a list. 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 1, April 11, 2006 
 */
function queryColumnTypes(dbquery) {
	var columnTypes="";
	var metadata=dbquery.getMetadata();
	var i=0;
	var column="";

	for (i=1; i lte metadata.getColumnCount(); i=i+1) {
		column = metadata.getColumnLabel(javaCast("int",i));
		columnTypes = listAppend(columnTypes,dbquery.getColumnTypeName(metadata.getColumnType(dbquery.findColumn(column))));
	}

	return columnTypes;
}
</cfscript>