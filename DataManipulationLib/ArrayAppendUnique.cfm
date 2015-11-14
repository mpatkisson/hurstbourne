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
 * Appends a value to an array if the value does not already exist within the array.
 * 
 * @param a1 	 The array to modify. 
 * @param val 	 The value to append. 
 * @return Returns a modified array or an error string. 
 * @author Craig Fisher (craig@altainteractive.com) 
 * @version 1, October 29, 2001 
 */
function ArrayAppendUnique(a1,val) {
	if ((NOT IsArray(a1))) {
		writeoutput("Error in <Code>ArrayAppendUnique()</code>! Correct usage: ArrayAppendUnique(<I>Array</I>, <I>Value</I>) -- Appends <em>Value</em> to the array if <em>Value</em> does not already exist");
		return 0;
	}
	if (NOT ListFind(Arraytolist(a1), val)) {
		arrayAppend(a1, val);
	}
	return a1;
}
</cfscript>