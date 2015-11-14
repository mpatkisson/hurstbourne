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
 * Checks is all elements of a list X is found in a list Y.
 * v2 by Raymond Camden
 * v3 idea by Bill King
 * v4 fix by Chris Phillips
 * 
 * @param l1 	 The first list. (Required)
 * @param l2 	 The second list. UDF checks to see if all of l1 is in l2. (Required)
 * @param delim1 	 List delimiter for l1. Defaults to a comma. (Optional)
 * @param delim2 	 List delimiter for l2. Defaults to a comma. (Optional)
 * @param matchany 	 If true, UDF returns true if at least one item in l1 exists in l2. Defaults to false. (Optional)
 * @return Returns a boolean. 
 * @author Daniel Chicayban (dbastos@math.utoledo.edu) 
 * @version 4, September 4, 2008 
 */
function isListInList(l1,l2) {
	var delim1 = ",";
	var delim2 = ",";
	var i = 1;
	var matchany = false;
	
	if(arrayLen(arguments) gte 3) delim1 = arguments[3];
	if(arrayLen(arguments) gte 4) delim2 = arguments[4];
	if(arrayLen(arguments) gte 5) matchany = arguments[5];
	
	for(i=1; i lte listLen(l1,delim1); i=i+1) {
		if(matchany and listFind(l2,listGetAt(l1,i,delim1),delim2)) return true;
		if(not matchany and not listFind(l2,listGetAt(l1,i,delim1),delim2)) return false;
	}
	return not matchany;
}
</cfscript>