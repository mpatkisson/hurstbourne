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
 * Removes duplicate values from an array.
 * 
 * @param inputArray 	 Array to dedupe. (Required)
 * @return Returns an array. 
 * @author Dave Anderson (the.one.true.dave.anderson@gmail.com) 
 * @version 1, April 26, 2012 
 */
public array function deDupeArray(required array inputArray) {
	local.arrList = arrayToList(inputArray);
	local.retArr = inputArray;
	for (local.i = arrayLen(inputArray);i gte 1;i=i-1) {
		if (listValueCountNoCase(arrList,inputArray[i]) gt 1) {
			arrayDeleteAt(retArr,i);
			arrList = arrayToList(retArr);
		}
	}
	return retArr;
}
</cfscript>