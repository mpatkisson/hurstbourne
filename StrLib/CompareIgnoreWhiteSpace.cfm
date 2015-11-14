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
 * Performs a comparison of two strings ignoring any whitespace characters.
 * 
 * @param string1 	 First string to compare. (Required)
 * @param string2 	 Second string to compare. (Required)
 * @param isCompareCaseSensitive 	 Determines if the comparison should check case. Default is true. (Optional)
 * @return Returns a boolean. 
 * @author Mark G. Smith (mark.g.smith@baesystems.com) 
 * @version 1, December 2, 2008 
 */
function CompareIgnoreWhiteSpace(string1,string2) {
	var string1NoWhiteSpace = REReplace(string1,"[\s]","","ALL");
	var string2NoWhiteSpace = REReplace(string2,"[\s]","","ALL");
	var isCompareCaseSensitive = true;
	
	if(arrayLen(arguments) gte 3) isCompareCaseSensitive = arguments[3];
	
	if (isCompareCaseSensitive)
		return Compare(string1NoWhiteSpace, string2NoWhiteSpace);
	else
		return CompareNoCase(string1NoWhiteSpace, string2NoWhiteSpace);
}
</cfscript>