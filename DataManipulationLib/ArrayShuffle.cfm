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
 * Shuffles the values in a one-dimensional array.
 * 
 * @param ar 	 One dimensional array you want shuffled. 
 * @return Returns an array. 
 * @author Ivan Latunov (ivan@cfchat.net) 
 * @version 1, October 9, 2001 
 */
function ArrayShuffle(ar) {
	var ar1=ArrayNew(1);
	var i=1;
	var n=1;
	var len=ArrayLen(ar);
	if (NOT IsArray(ar,1)) {
		writeoutput("Error in <Code>ArrayShuffle()</code>! Correct usage: ArrayShuffle(<I>Array</I>) - Shuffles the values in one dimensional Array");
		return 0;
	}
	
	if (ArrayLen(ar) eq 0) {
		return ar1;
	}
	
	for (i=1; i lte len; i=i+1) {
		n = RandRange(1,ArrayLen(ar));
		ArrayAppend(ar1,ar[n]);
		ArrayDeleteAt(ar,n);
	}
	return ar1;
}
</cfscript>