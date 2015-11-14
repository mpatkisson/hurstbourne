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
 * Changes a query into a struct of arrays.
 * 
 * @param query 	 The query to be transformed. 
 * @return Returns a structure. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, February 23, 2002 
 */
function queryToStructOfArrays(q){
		//a variable to hold the struct
		var st = structNew();
		//two variable for iterating
		var ii = 1;
		var cc = 1;
		//grab the columns into an array for easy looping
		var cols = listToArray(q.columnList);
		//iterate over the columns of the query and create the arrays of values
		for(ii = 1; ii lte arrayLen(cols); ii = ii + 1){
			//make the array with the col name as the key in the root struct
			st[cols[ii]] = arrayNew(1);
			//now loop for the recordcount of the query and insert the values
			for(cc = 1; cc lte q.recordcount; cc = cc + 1)
				arrayAppend(st[cols[ii]],q[cols[ii]][cc]);
		}
		//return the struct
		return st;
	}
</cfscript>