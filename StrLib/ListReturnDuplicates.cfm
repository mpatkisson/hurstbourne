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
 * Searches a list for case- sensitive Duplicates and returns a list of the duplicate items or an empty string if no dupes are found.
 * 
 * @param list 	 List to parse. (Required)
 * @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Gerald Guido (Gerald.Guido@gmail.com) 
 * @version 0, October 18, 2008 
 */
function ListReturnDuplicates(list) {
	var i = 1;
	var delimiter = ',';
	var returnValue1 = '';
	var tmpList = list;

	if(arrayLen(arguments) GTE 2) delimiter = arguments[2];
	list = ListToArray(list, delimiter);
	for(i = 1; i LTE ArrayLen(list); i = i + 1) if(ListValueCount(tmpList, list[i]) GT 1 and not listFind(returnValue1,list[i],delimiter)) returnValue1 = ListAppend(returnValue1, list[i], delimiter);

	return returnValue1;
}
</cfscript>