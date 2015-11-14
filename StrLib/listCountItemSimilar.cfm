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
 * Determines number of list items that begin with the strToMatch.
 * v2 edits by RCamden
 * 
 * @param listIn 	 List of values. (Required)
 * @param strToMatch 	 String to search for in the beginning of each list item. (Optional)
 * @param delimeter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author Tony Felice (sites@breckcomm.com) 
 * @version 2, January 6, 2009 
 */
function listCountItemSimilar(listIn,strToMatch){
	var delim = ",";
	var count = 0;
	var xz = "";
	
	if(arrayLen(arguments) gt 2) delim = arguments[3];
	for(xz=1;xz<=listLen(listIn,delim);xz=xz+1) {
		count = count + findNoCase(strToMatch,left(listGetAt(listIn,xz,delim),len(strToMatch)));									
	}
	return count;
}
</cfscript>