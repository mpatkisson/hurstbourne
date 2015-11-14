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
 * Appends one list to another, with a maximum list length specified, and replaces any overlapping values.
 * 
 * @param list1 	 The original list. (Required)
 * @param list2 	 The list to append. (Required)
 * @param length 	 The max list length allowed for the new list. (Required)
 * @param delimiters 	 List delimiters. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Kit Brandner (kit.brandner@serebra.com) 
 * @version 1, August 10, 2007 
 */
function listAppendAndReplace( list1, list2, length) {
	var delimiters = ",";
	var pos = length;
	var returnList = list1;
	if (arguments.length ge 4 and len(trim(arguments[4])) gt 0) delimiters = trim(arguments[4]);
	for ( ; pos ge (length - listLen(list2, delimiters)) ; pos = pos - 1) {
		if (listLen(list1, delimiters) gt pos)	returnList = listDeleteAt(returnList, pos + 1, delimiters);
	}
	if (left(list2, 1) eq delimiters) list2 = right(list2, len(list2) - 1);
	returnList = trim(returnList) & iif(right(returnList, 1) neq delimiters and (len(trim(list2)) gt 0 and len(trim(returnList)) gt 0), de(delimiters), de("")) & trim(list2);
	return returnList;
}
</cfscript>