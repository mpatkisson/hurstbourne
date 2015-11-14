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
 * Compares two arrays (with simple values) and returns the difference between the two.
 * 
 * @param smallerArray 	 First array. (Required)
 * @param biggerArray 	 Second array. (Required)
 * @return Returns an array. 
 * @author Greg Nettles (gregnettles@gmail.com) 
 * @version 1, March 13, 2007 
 */
function arrayDiff(smallerArray,biggerArray) {
	var i = "";
	var result = arrayNew(1);
	var s = arrayToList(arguments.smallerArray);
	for (i=1;i lte arrayLen(arguments.biggerArray); i=i+1) if (listFind(s, arguments.biggerArray[i]) is 0) arrayAppend(result, arguments.biggerArray[i]);
	return result;
}
</cfscript>