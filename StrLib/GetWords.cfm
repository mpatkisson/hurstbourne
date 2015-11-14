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
 * Shortens a string without cutting words in half.
 * Modified by Raymond Camden on July 30, 2001
 * 
 * @param str 	 The string to modify. 
 * @param words 	 The number of words to display. 
 * @author David Grant (david@insite.net) 
 * @version 2, July 30, 2001 
 */
function getWords(str,words) {
	var numWords = 0;
	var oldPos = 1;
	var i = 1;
	var strPos = 0;
	
	str = trim(str);
	str = REReplace(str,"[[:space:]]{2,}"," ","ALL");
	numWords = listLen(str," ");
	if (words gte numWords) return str;
	for (i = 1; i lte words; i=i+1) {
		strPos = find(" ",str,oldPos);
		oldPos = strPos + 1;
	}
	if (len(str) lte strPos) return left(str,strPos-1);
	return left(str,strPos-1) & "...";
}
</cfscript>