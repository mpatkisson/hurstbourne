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
 * Trim spaces from all records in a query.
 * 
 * @param qry 	 The query to trim. (Required)
 * @return Returns a query. 
 * @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 * @version 1, February 26, 2004 
 */
function trimQuery(qry) {
	var col="";
	var i=1;
	var j=1;
	for(;i lte qry.recordCount;i=i+1) {
		for(j=1;j lte listLen(qry.columnList);j=j+1) {
			col=listGetAt(qry.columnList,j);
			querySetCell(qry,col,trim(qry[col][i]),i);
		}
	}
	return qry;
}
</cfscript>