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
 * Converts a query to excel-ready format.
 * Version 2 by Andrew Tyrone. It now returns a string instead of directly outputting.
 * 
 * @param query 	 The query to use. (Required)
 * @param headers 	 A list of headers. Defaults to col. (Optional)
 * @param cols 	 The columns of the query. Defaults to all columns. (Optional)
 * @param alternateColor 	 The color to use for every other row. Defaults to white. (Optional)
 * @return Returns a string. 
 * @author Jesse Monson (jesse@ixstudios.com) 
 * @version 2, February 23, 2005 
 */
function Query2Excel(query) {
	var InputColumnList = query.columnList;
	var Headers = query.columnList;

	var AlternateColor = "FFFFFF";
	var header = "";
	var headerLen = 0;
	var col = "";
	var colValue = "";
	var colLen = 0;
	var i = 1;
	var j = 1;
	var k = 1;
	
	var HTMLData = "";
	
	if (arrayLen(arguments) gte 2) {
		Headers = arguments[2];
	}
	if (arrayLen(arguments) gte 3) {
		InputColumnList = arguments[3];
	}

	if (arrayLen(arguments) gte 4) {
		AlternateColor = arguments[4];
	}
	if (listLen(InputColumnList) neq listLen(Headers)) {
		return "Input Column list and Header list are not of equal length";
	}
	
	HTMLData = HTMLData & "<table border=1><tr bgcolor=""C0C0C0"">";
	for (i=1;i lte ListLen(Headers);i=i+1){
		header=listGetAt(Headers,i);
		headerLen=Len(header)*10;
		HTMLData = HTMLData & "<th width=""#headerLen#""><b>#header#</b></th>";
	}
	HTMLData = HTMLData & "</tr>";
	for (j=1;j lte query.recordcount;j=j+1){
		if (j mod 2) {
			HTMLData = HTMLData & "<tr bgcolor=""FFFFFF"">";
		} else {
			HTMLData = HTMLData & "<tr bgcolor=""#alternatecolor#"">";
		}
		for (k=1;k lte ListLen(InputColumnList);k=k+1) {
			col=ListGetAt(InputColumnList,k);
			colValue=query[trim(col)][j];
			colLength=Len(colValue)*10;
			if (NOT Len(colValue)) {
				colValue="&nbsp;";
			} 
			if (isNumeric(colValue) and Len(colValue) gt 10) {
				colValue="'#colValue#";
			} 
			HTMLData = HTMLData & "<td width=""#colLength#"">#colValue#</td>";
		}
	HTMLData = HTMLData & "</tr>";
	}
	HTMLData = HTMLData & "</table>";
	
	return HTMLData;
}
</cfscript>