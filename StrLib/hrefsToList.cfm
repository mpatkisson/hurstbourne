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
 * Extracts all links from a given string and puts them into a list.
 * 
 * @param inputString 	 String to parse. (Required)
 * @param delimiter 	 Delimiter for returned list. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Marcus Raphelt (cfml@raphelt.de) 
 * @version 1, February 22, 2006 
 */
function hrefsToList(inputString) {
	var pos=1;
	var tmp=0;
	var linklist = "";
	var delimiter = ",";
	var endpos = "";
	
	if(arrayLen(arguments) gte 2) delimiter = arguments[2];
		
	while(1) {
		tmp = reFindNoCase("<a[^>]*>[^>]*</a>", inputString, pos);
		if(tmp) {
			pos = tmp;
			endpos = findNoCase("</a>", inputString, pos)+4;
			linkList = listAppend(linkList, mid(inputString, pos, endpos-pos), delimiter);
			pos = endpos;
		}
		else break;
	}

	return linkList;
}
</cfscript>