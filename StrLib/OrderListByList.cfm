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
 * Reorders a list to the order of another, placing elements from the complete list not found in the second at the end of the reordered list.
 * 
 * @param list1 	 Initial list. (Required)
 * @param list2 	 List to use for ordering. (Required)
 * @param delim1 	 Delimiter for list1. Defaults to comma. (Optional)
 * @param delim2 	 Delimiter for list2. Defaults to comma. (Optional)
 * @param delim3 	 Delimiter to use for returned list. Defaults to comma. (Optional)
 * @return Returns a list. 
 * @author Erik Madsen (emadsenus@yahoo.com) 
 * @version 2, October 3, 2002 
 */
function OrderListByList(List1, List2) {
 	var ExtraList = "";
	var ResultList = "";
  	var Delim1 = ",";
  	var Delim2 = ",";
  	var Delim3 = ",";
  	var i = 0;
	var j = 0;
	var o = 1;
	var o2 = 1;
	
	// Handle optional arguments
	switch(ArrayLen(arguments)) {
	  case 3:
	    {
	      Delim1 = Arguments[3];
	      break;
	    }
	  case 4:
	    {
	      Delim1 = Arguments[3];
	      Delim2 = Arguments[4];
	      break;
	    }
	  case 5:
	    {
	      Delim1 = Arguments[3];
	      Delim2 = Arguments[4];          
	      Delim3 = Arguments[5];
	      break;
	    }        
	}
	for (i=1; i LTE ListLen(List2, "#Delim2#"); i=i+1)
	{
		 if (ListFindNoCase(List1, ListGetAt(List2, i, "#Delim2#"), "#Delim1#")){
		 	for(o=1; o LTE ListValueCount(List1, ListGetAt(List2, i, "#Delim2#") , "#Delim1#"); o=o+1){
		 		ResultList = ListAppend(ResultList, ListGetAt(List2, i, "#Delim2#"), "#Delim3#");
			}
		 }
	}
	for (j=1; j LTE ListLen(List1, "#Delim1#"); j=j+1)
	{
		 if (not ListFindNoCase(ResultList, ListGetAt(List1, j, "#Delim1#"), "#Delim3#")){
		 	for(o2=1; o2 LTE ListValueCount(List1, ListGetAt(List1, j, "#Delim1#") , "#Delim1#"); o2=o2+1){
		 		ResultList = ListAppend(ResultList, ListGetAt(List1, j, "#Delim1#"), "#Delim3#");
			}
		 }
	}
	Return ResultList;
 }
</cfscript>