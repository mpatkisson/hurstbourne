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
 * Same functionality as CF ListRest starting from right instead of left.
 * 
 * @param orgList 	 Original list. (Required)
 * @param listDel 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Antoine Gattolliat (antoine@igloo.be) 
 * @version 1, December 6, 2009 
 */
function ListRestRight(orgList) {
	var listDel = ',';
	if(arrayLen(arguments) gte 2) listDel = arguments[2];
	if (len(orgList) gt 0) return listDeleteAt(orgList,ListLen(orgList,listDel),listDel);
	return "";
}
</cfscript>