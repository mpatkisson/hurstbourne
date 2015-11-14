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
 * Transform a query result into a csv formatted variable.
 * 
 * @param query 	 The query to transform. (Required)
 * @param headers 	 A list of headers to use for the first row of the CSV string. Defaults to cols. (Optional)
 * @param cols 	 The columns from the query to transform. Defaults to all the columns. (Optional)
 * @return Returns a string. 
 * @author adgnot sebastien (sadgnot@ogilvy.net) 
 * @version 1, June 26, 2002 
 */
function QueryToCsv(query){
	var csv = "";
	var cols = "";
	var headers = "";
	var i = 1;
	var j = 1;
	
	if(arrayLen(arguments) gte 2) headers = arguments[2];
	if(arrayLen(arguments) gte 3) cols = arguments[3];
	
	if(cols is "") cols = query.columnList;
	if(headers IS "") headers = cols;
	
	headers = listToArray(headers);
	
	for(i=1; i lte arrayLen(headers); i=i+1){
		csv = csv & """" & headers[i] & """;";
	}

	csv = csv & chr(13) & chr(10);
	
	cols = listToArray(cols);
	
	for(i=1; i lte query.recordCount; i=i+1){
		for(j=1; j lte arrayLen(cols); j=j+1){
			csv = csv & """" & query[cols[j]][i] & """;";
		}		
		csv = csv & chr(13) & chr(10);
	}
	return csv;
}
</cfscript>