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
 * Abbreviates a given string to roughly the given length, stripping any tags, making sure the ending doesn't chop a word in two, and adding an ellipsis character at the end.
 * Fix by Patrick McElhaney
 * v3 by Ken Fricklas kenf@accessnet.net, takes care of too many spaces in text.
 * 
 * @param string 	 String to use. (Required)
 * @param len 	 Length to use. (Required)
 * @return Returns a string. 
 * @author Gyrus (gyrus@norlonto.net) 
 * @version 3, September 6, 2005 
 */
function abbreviate(string,len) {
	var newString = REReplace(string, "<[^>]*>", " ", "ALL");
	var lastSpace = 0;
	newString = REReplace(newString, " \s*", " ", "ALL");
	if (len(newString) gt len) {
		newString = left(newString, len-2);
		lastSpace = find(" ", reverse(newString));
		lastSpace = len(newString) - lastSpace;
		newString = left(newString, lastSpace) & "  &##8230;";
	}	
	return newString;
}
</cfscript>