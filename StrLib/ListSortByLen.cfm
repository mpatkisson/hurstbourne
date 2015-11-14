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
 * Sorts a list by the length of its elements.
 * 
 * @param list 	 The list to sort. (Required)
 * @param sortDir 	 Direction of sort. Default is "asc." (Optional)
 * @param delimiters 	 List delimiter. Default is a comma. (Optional)
 * @return Returns a string. 
 * @author Rob Baxter (rob@microjuris.com) 
 * @version 1, April 30, 2003 
 */
function ListSortByLen(ListToSort) {
	var SortOrder = "asc";
	var Delimiters = ",";
	var ListIsSorted = "no";
	var ListLen = ListLen(ListToSort, Delimiters);
	var CurListItem = "";
	var NextListItem = "";

	if (ArrayLen(Arguments) gt 1) SortOrder = Arguments[2];
	
	if (ArrayLen(Arguments) gt 2) Delimiters = Arguments[3];
		
	while (Not ListIsSorted) {
		ListIsSorted = "yes";
		for (N = 1; N+1 lte ListLen; N=N+1) {
			CurListItem = ListGetAt(ListToSort, N, Delimiters);
			NextListItem = ListGetAt(ListToSort, N+1, Delimiters);
			
			if( (sortOrder is "asc" and len(curListItem) gt len(nextListItem)) or (sortOrder is "desc" and len(curListItem) lt len(nextListItem))) {
				listToSort = listSetAt(listToSort,n,nextListItem,delimiters);
				listToSort = listSetAt(listToSort,n+1,curListItem,delimiters);
				ListIsSorted = "no";
			}
		}
	}
	return ListToSort;
}
</cfscript>