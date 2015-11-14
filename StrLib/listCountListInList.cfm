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
 * Count the number of occurences of items from one list to another list.
 * Missing var statement fixed by Raymond Camden.
 * 
 * @param lst1 	 The first list. (Required)
 * @param lst2 	 The second list. (Required)
 * @return Returns a number. 
 * @author Trevor Orr (fractorr@yahoo.com) 
 * @version 1, April 7, 2006 
 */
function listCountListInList(lst1, lst2) {
	var delim   = ",";
	var cnt 	= 0;
	var pos 	= 0;
	var item    = "";
	
	if (arrayLen(arguments) gt 2) delim = arguments[3];
		
	for(item=1; item LTE ListLen(lst2); item = item + 1) {
		pos = listFindNoCase(lst1, ListGetAt(lst2, item));
		if(pos) cnt = cnt + 1;
	}
	
	return cnt;
}
</cfscript>