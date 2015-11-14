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
 * This functions helps to quickly build arrays, both simple and complex.
 * 
 * @param paramN 	 This UDF accepts N optional arguments. Each argument is added to the returned array. (Optional)
 * @return Returns an array. 
 * @author Erki Esken (erki@dreamdrummer.com) 
 * @version 1, July 3, 2002 
 */
function Array() {
	var result = ArrayNew(1);
	var to = ArrayLen(arguments);
	var i = 0;
	for (i=1; i LTE to; i=i+1)
		result[i] = Duplicate(arguments[i]);
	return result;
}
</cfscript>