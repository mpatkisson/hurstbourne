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
 * Changes a given array of structures to a structure of arrays.
 * 
 * @param ar 	 Array of structs. (Required)
 * @return Returns a struct. 
 * @author Nathan Strutz (mrnate@hotmail.com) 
 * @version 1, September 21, 2004 
 */
function arrayOfStructsToStructOfArrays(ar) {
	var st = structNew();
	var arKeys = structKeyArray(ar[1]);
	var i=0;
	var j=0;
	var arLen = arrayLen(ar);
	for (i=1;i lte arrayLen(arKeys);i=i+1) {
		st[arKeys[i]] = arrayNew(1);
		for (j=1;j lte arLen;j=j+1) {
			st[arKeys[i]][j] = ar[j][arKeys[i]];
		}
	}
	return st;
}
</cfscript>