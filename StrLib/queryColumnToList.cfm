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
 * Takes a selected column of data from a query and converts it into a list.
 * 
 * @param qry 	 Query to use. (Required)
 * @param column 	 Column to use. (Required)
 * @param delim 	 Delimiter. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Randy Johnson (randy@cfedge.com) 
 * @version 1, January 4, 2007 
 */
function queryColumnToList(qry, column) {
	var theList = "";
	var counter = "";
	var num_rows = arguments.qry.recordcount;
	var delim = ",";
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	for (counter=1; counter lte num_rows; counter=counter+1) theList = listAppend(theList, arguments.qry[arguments.column][counter],delim);
	return theList;
}
</cfscript>