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
 * Returns a list of distinct values from a passed-in list.
 * 
 * @param theList 	 The list. (Required)
 * @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Dave Carabetta (dcarabetta@gmail.com) 
 * @version 1, February 24, 2005 
 */
function listGetDistinctValues(theList) {
	var distinctValues = "";
	var totalValues = 0;
	var i = 0;
	var currentElement = "";
	var delimiter = ",";
	
	// If the user specifies their own delimiter, use that one instead
	if (arrayLen(arguments) GT 1) delimiter = arguments[2];
	
	totalValues = listLen( theList, delimiter );
	
	// Loops over each element in the original list and appends the current
	// element if it does not already exist in the distinct values list
	for (i=1; i LTE totalValues; i=i+1) {
		currentElement = listGetAt(theList, i, delimiter);
		if (not listFind(distinctValues, currentElement, delimiter) ) {
			distinctValues = listAppend(distinctValues, currentElement, delimiter);
		}
	}
	
	return distinctValues;
}
</cfscript>