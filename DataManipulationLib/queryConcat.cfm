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
 * Concatenate two queries together.
 * 
 * @param q1 	 First query. (Optional)
 * @param q2 	 Second query. (Optional)
 * @return Returns a query. 
 * @author Chris Dary (umbrae@gmail.com) 
 * @version 1, February 23, 2006 
 */
function queryConcat(q1,q2) {
	var row = "";
	var col = "";

	if(q1.columnList NEQ q2.columnList) {
		return q1;
	}

	for(row=1; row LTE q2.recordCount; row=row+1) {
	 queryAddRow(q1);
	 for(col=1; col LTE listLen(q1.columnList); col=col+1)
		querySetCell(q1,ListGetAt(q1.columnList,col), q2[ListGetAt(q1.columnList,col)][row]);
	}
	return q1;
}
</cfscript>