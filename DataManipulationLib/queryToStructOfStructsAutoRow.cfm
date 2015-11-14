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
 * Converts a query to a structure of structures with the primary index of the main structure auto incremented.
 * 
 * @param theQuery 	 The query to transform. (Required)
 * @return Returns a struct. 
 * @author Peter J. Farrell (pjf@maestropublishing.com) 
 * @version 1, September 23, 2004 
 */
function queryToStructOfStructsAutoRow(theQuery){
	var theStructure = StructNew();
	var cols = ListToArray(theQuery.columnlist);
	var row = 1;
	var thisRow = "";
	var col = 1;
	
	for(row = 1; row LTE theQuery.recordcount; row = row + 1){
		thisRow = StructNew();
		for(col = 1; col LTE arraylen(cols); col = col + 1){
			thisRow[cols[col]] = theQuery[cols[col]][row];
		} 
		theStructure[row] = Duplicate(thisRow);
	} 
	return theStructure;
}
</cfscript>