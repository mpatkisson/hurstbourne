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
 * Converts a query object into an array of structures.
 * 
 * @param query 	 The query to be transformed 
 * @return This function returns a structure. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, September 27, 2001 
 */
function QueryToArrayOfStructures(theQuery){
	var theArray = arraynew(1);
	var cols = ListtoArray(theQuery.columnlist);
	var row = 1;
	var thisRow = "";
	var col = 1;
	for(row = 1; row LTE theQuery.recordcount; row = row + 1){
		thisRow = structnew();
		for(col = 1; col LTE arraylen(cols); col = col + 1){
			thisRow[cols[col]] = theQuery[cols[col]][row];
		}
		arrayAppend(theArray,duplicate(thisRow));
	}
	return(theArray);
}
</cfscript>