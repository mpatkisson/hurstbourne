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
 * Concatenates two arrays.
 * 
 * @param a1 	 The first array. 
 * @param a2 	 The second array. 
 * @return Returns an array. 
 * @author Craig Fisher (craig@altainetractive.com) 
 * @version 1, September 13, 2001 
 */
function ArrayConcat(a1, a2){
	var i=1;
	if ((NOT IsArray(a1)) OR (NOT IsArray(a2))) {
		writeoutput("Error in <Code>ArrayConcat()</code>! Correct usage: ArrayConcat(<I>Array1</I>, <I>Array2</I>) -- Concatenates Array2 to the end of Array1");
		return 0;
	}
	for (i=1;i LTE ArrayLen(a2);i=i+1) {
		ArrayAppend(a1, Duplicate(a2[i]));
	}
	return a1;
}
</cfscript>