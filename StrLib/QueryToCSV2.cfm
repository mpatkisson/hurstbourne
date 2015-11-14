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
 * Convert the query into a CSV format using Java StringBuffer Class.
 * 
 * @param query 	 The query to convert. (Required)
 * @param headers 	 A list of headers to use for the first row of the CSV string. Defaults to all the columns. (Optional)
 * @param cols 	 The columns from the query to transform. Defaults to all the columns. (Optional)
 * @return Returns a string. 
 * @author Qasim Rasheed (qasimrasheed@hotmail.com) 
 * @version 1, March 23, 2005 
 */
function QueryToCSV2(query){
	var csv = createobject( 'java', 'java.lang.StringBuffer');
	var i = 1;
	var j = 1;
	var cols = "";
	var headers = "";
	var endOfLine = chr(13) & chr(10);
	if (arraylen(arguments) gte 2) headers = arguments[2];
	if (arraylen(arguments) gte 3) cols = arguments[3];
	if (not len( trim( cols ) ) ) cols = query.columnlist;
	if (not len( trim( headers ) ) ) headers = cols;
	headers = listtoarray( headers );
	cols = listtoarray( cols );
	
	for (i = 1; i lte arraylen( headers ); i = i + 1)
		csv.append( '"' & headers[i] & '",' );
	csv.append( endOfLine );
	
	for (i = 1; i lte query.recordcount; i= i + 1){
		for (j = 1; j lte arraylen( cols ); j=j + 1){
			if (isNumeric( query[cols[j]][i] ) )
				csv.append( query[cols[j]][i] & ',' );
			else
				csv.append( '"' & query[cols[j]][i] & '",' );
			
		}
		csv.append( endOfLine );
	}
	return csv.toString();
}
</cfscript>