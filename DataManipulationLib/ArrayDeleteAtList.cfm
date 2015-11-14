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
 * Deletes an elements list from an array.
 * 
 * @param a 	 The array to modify. (Required)
 * @param l 	 The list of indexes to remove. (Required)
 * @return Returns an array. 
 * @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 * @version 1, January 21, 2005 
 */
function ArrayDeleteAtList(a,l) {
	var i=1;
	l = listSort(l, "numeric", "desc");
	for(i=1; i lte listLen(l); i=i+1) arrayDeleteAt(a, listGetAt(l,i));
	return a;
}
</cfscript>