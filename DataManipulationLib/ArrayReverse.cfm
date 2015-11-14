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
 * Reverses the order of elements in a one-dimensional array.
 * 
 * @param InArray 	 One-dimensional array to be reversed. 
 * @return Returna a new one dimensional array. 
 * @author Raymond Simmons (raymond@terraincognita.com) 
 * @version 1.0, October 9, 2001 
 */
function ArrayReverse(inArray){
	var outArray = ArrayNew(1);
	var i=0;
        var j = 1;
	for (i=ArrayLen(inArray);i GT 0;i=i-1){
		outArray[j] = inArray[i];
		j = j + 1;
	}
	return outArray;
}
</cfscript>