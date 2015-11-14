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
 * Split list into two lists of about equal length.
 * RCamden added variable delim and clean up of trailing delim
 * 
 * @param orgList 	 Original list. (Required)
 * @param listDel 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns a sturct. 
 * @author Tom Kitta (tom@tomkitta.com) 
 * @version 2, August 1, 2006 
 */
function splitList(orgList) {
	var ret = structNew();
	var listDel = ",";
	var i = 0;
	var listLen = "";
	var midPoint = "";
	
	if(arrayLen(arguments) gte 2) listDel = arguments[2];
	
	listLength = listLen(orgList,listDel);
	midPoint = round(listLength/2);

	ret.part1 = "";
	ret.part2 = orgList;

	for (i=1;i lte midPoint;i=i+1) ret.part2 = ListDeleteAt(ret.part2,1, listDel);
	if (listLength gt 0) ret.part1 = left(arguments.orgList,len(arguments.orgList) - Len(ret.part2));
	
	if(right(ret.part1,1) is listDel) ret.part1 = left(ret.part1, len(ret.part1)-1);
	return ret;
}
</cfscript>