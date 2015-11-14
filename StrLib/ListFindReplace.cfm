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
 * Finds a value in one list and returns the matching string at the same index in another list.
 * 
 * @param string 	 List to parse. (Required)
 * @param listToMatch 	 List of terms to match. (Required)
 * @param listToReplace 	 Matching list of words to use as replacements. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author BenJamin Prater (bprater@bluefoxlabs.com) 
 * @version 1, August 4, 2005 
 */
function listFindReplace(string, listToMatch, listToReplace) {
	var index = "";
	var delim = ",";
	
	if(arrayLen(arguments) gte 4) delim = arguments[4];
	
	index = listFind(listToMatch, string, delim);
	
	if(index neq 0) return listGetAt(listToReplace, index, delim);
	else return string;
}
</cfscript>