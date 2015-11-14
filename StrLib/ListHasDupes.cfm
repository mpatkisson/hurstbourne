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
 * Returns true if list has duplicate elements.
 * 
 * @param list 	 The list to check. (Required)
 * @param delim 	 List delimer. Defaults to a comma. (Optional)
 * @param caseCheck 	 Determines if checking should be case-sensitive. Defaults to false. (Optional)
 * @return Returns a boolean. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 1, May 11, 2004 
 */
function listHasDupes(list) {
	var arr=arraynew(1);
	var caseCheck=false;
	var delim=",";
	var i = 1;
	
	if (arrayLen(arguments) gt 1) delim = arguments[2];	
	if (arrayLen(arguments) gt 2) CaseCheck=Arguments[3];
	
	if(not caseCheck) list = lcase(list);
	
	arr=listToArray(list,delim);
	
	for (;i lte arraylen(arr);i=i+1 ) {
		if (listValueCount(list,arr[i],delim) gt 1) return true;
	}
	return false;
}
</cfscript>