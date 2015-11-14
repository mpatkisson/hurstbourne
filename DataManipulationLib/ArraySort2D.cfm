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
 * Sorts a two dimensional array by the specified column in the second dimension.
 * 
 * @return Returns an array. 
 * @author Robert West (robert.west@digiphilic.com) 
 * @version 1, October 8, 2002 
 */
function ArraySort2D(arrayToSort, sortColumn, type) {
	var order = "asc";
	var i = 1;
	var j = 1;
	var thePosition = "";
	var theList = "";
	var arrayToReturn = ArrayNew(2);
	var sortArray = ArrayNew(1);
	var counter = 1;
	if (ArrayLen(Arguments) GT 3){
		order = Arguments[4];
	}
	for (i=1; i LTE ArrayLen(arrayToSort); i=i+1) {
		ArrayAppend(sortArray, arrayToSort[i][sortColumn]);
	}
	theList = ArrayToList(sortArray);
	ArraySort(sortArray, type, order);
	for (i=1; i LTE ArrayLen(sortArray); i=i+1) {
		thePosition = ListFind(theList, sortArray[i]);
		theList = ListDeleteAt(theList, thePosition);
		for (j=1; j LTE ArrayLen(arrayToSort[thePosition]); j=j+1) {
			arrayToReturn[counter][j] = arrayToSort[thePosition][j];
		}
		ArrayDeleteAt(arrayToSort, thePosition);
		counter = counter + 1;
	}
	return arrayToReturn;
}
</cfscript>