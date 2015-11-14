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
 * Merge two queries.
 * 
 * @param querysource 	 Source query. (Required)
 * @param queryoutput 	 Destination query. (Required)
 * @param keyColumn 	 Column (that exists in both queries) to merge on. (Required)
 * @param mergeList 	 List of columns from source query to add to destination query. Defaults to all of them. (Optional)
 * @return Returns a query. 
 * @author Alain Blais (Alain_blais@hotmail.com) 
 * @version 1, July 21, 2004 
 */
function querymerge(querysource,queryoutput,keyColumn){
	var mergeColumn = querysource.columnlist;
	var valueArray = arrayNew(1);
	// define counters
	var i = 1;
	var iRow = 1;
	var jRow = 1;
	//if there is a 4th argument, use that as the mergeColumn
	if(arrayLen(arguments) GT 3) mergeColumn = arguments[4];	
	//loop through the merge column
	for(i=1; i lte listLen(mergeColumn,','); i=i+1) {
		if (listFindNoCase(queryoutput.columnlist,listGetAt(mergeColumn,i,','),',') eq 0) {
		    // loop through each row of queryoutput and add information from querysource
			found = listGetAt(mergeColumn,i,',');
		    for (iRow=1; iRow lte queryoutput.recordcount; iRow=iRow+1) {
			    // find the row in querysource that matches the value in keycolumn from queryoutput  
				jRow = 1;
				while (jRow lt querysource.recordcount and querysource[keyColumn][jRow] neq queryoutput[keycolumn][iRow]) {
				    jRow = jRow + 1;
				}
				if (querysource[keyColumn][jRow] eq queryoutput[keycolumn][iRow]) {
				    valueArray[iRow] = querysource[listGetAt(mergeColumn,i,',')][jRow];
				}
			}
		    // add the columnm
			queryaddcolumn(queryoutput,listGetAt(mergeColumn,i,','),valueArray);
		}
	}
	return queryoutput;
}
</cfscript>