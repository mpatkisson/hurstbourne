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
 * Returns information about the differences between 2 queries with the same columns.
 * 
 * @param q1 	 The first query. (Required)
 * @param q2 	 The second query. (Required)
 * @return Returns a structure. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, May 26, 2003 
 */
function queryDiff(q1,q2){
	//vars for looping
	var ii = 0;
	var cc = 0;
	//a struct to hold the result
	var result = structNew();
	//grab the columns -- NOTE: THIS VERSION ASSUMES THEY HAVE THE SAME COLUMNS!!
	var cols = listToArray(q1.columnList);
	var thisCol = "";
	//we'll loop whichever query is shortest.  by default, we'll loop query1
	var shorterQuery = q1;
	var longerQuery = q2;
	var keyToUseForLonger = "added";
	var sameSize = true;
	var rowDiff = 0;
	//vars to use in the loop
	var q1Value = "";
	var q2Value = "";
	var thenNow = structNew();
	//make the standard keys in the result
	result.changed = structNew();
	result.added = structNew();
	result.removed = structNew();
	result.query1 = q1;
	result.query2 = q2;
	//if the queries are not the same size, indicate that
	if(q1.recordCount NEQ q2.recordCount){
		sameSize = false;
		//if q2 is shorter, use that instead
		if(q1.recordCount GT q2.recordCount){
			shorterQuery = q2;
			longerQuery = q1;
			keyToUseForLonger = "removed";
		}
	}
	//loop the correct query to get rows that are different in Q2 from Q1
	for(ii = 1; ii LTE shorterQuery.recordCount; ii = ii + 1){
		for(cc = 1; cc LTE arrayLen(cols); cc = cc + 1){
			thisCol = cols[cc];
			q1Value = q1[thisCol][ii];
			q2Value = q2[thisCol][ii];
			//if this col is different, grab the row index
			if(compare(q1Value,q2Value)){
				//if we don't already have this row in the changed group, put it there
				if(NOT structKeyExists(result.changed,ii))
					result.changed[ii] = structNew();
				thenNow = structNew();
				thenNow.then = q1Value;
				thenNow.now = q2Value;
				thenNow.row = ii;
				thenNow.col = thisCol;
				result.changed[ii][thisCol] = thenNow;
			}
		}
	}
	//if they are not the same size, add the row index to the appropriate key
	if(NOT sameSize){
		rowDiff = longerQuery.recordCount - shorterQuery.recordCount;
		for(ii = rowDiff + shorterQuery.recordCount; ii LTE longerQuery.recordCount; ii = ii + 1){
			result[keyToUseForLonger][ii] = ii;
		}
	}
	//return the result
	return result;
}
</cfscript>