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
 * Returns a list with a specified factor of list elements from the passed list .
 * 
 * @param list 	 List to parse. (Required)
 * @param factorOf 	 Specifies how many items to skip before getting an item. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Sudhir Duddella (skduddella@hotmail.com) 
 * @version 1, March 6, 2003 
 */
function ListgetMultipleOf(List,factorOf){
	var delim = ",";
	var result = "";
	var i = 1;
	
	if (factorOf lte 0) return result;
	if (ArrayLen(arguments) gt 2) delim = arguments[3];
			
	for (i=1;i lte ListLen(List,delim); i = i+1) {
		if (i mod factorOf eq 0) result = ListAppend(result,ListGetAt(List,i,delim),delim);
	}
		
	return result;
}
</cfscript>