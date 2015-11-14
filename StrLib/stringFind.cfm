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
 * Returns matched substrings and subexpressions from a string based on a regular expression pattern
 * v1.0 by Adam Cameron
 * 
 * @param pattern 	 A regular expression to match. (Required)
 * @param string 	 A string to find matches in. (Required)
 * @param all 	 Whether to match one (default) or all matches. (Optional)
 * @param start 	 The position in the string to start looking for matches. (Optional)
 * @param caseSensitive 	 Whether to do a case-sensitive or case-insensitive (default) match. (Optional)
 * @return An array of structs, similar to reFind() when set to return subexpressions. 
 * @author Adam Cameron (adamcameroncoldfusion@gmail.com) 
 * @version 1.0, September 29, 2012 
 */
array function stringFind(required string pattern, required string string, boolean all=false, numeric start=1, boolean caseSensitive=false){
	var result	= [];
	var matches	= [];
	var i		= 0;
	var match	= "";

	do {
		if (caseSensitive){
			matches = reFind(pattern, string, start, true);
		}else{
			matches = reFindNoCase(pattern, string, start, true);
		}
		// if we have a match, we need to extract the matched strings too
		if (matches.pos[1]){
			matches.string = [];
			for (i=1; i <= arrayLen(matches.pos); i++){
				if (matches.len[i]){
					match = mid(string, matches.pos[i], matches.len[i]);
				}else{
					match = "";
				}
				arrayAppend(matches.string, match);
			}
			arrayAppend(result, matches);
			// if we were only after one match: we're done...
			if (!all){
				break;
			}
			// ... otherwise shimmy along to after this match, ready to look for the next one
			start = matches.pos[1] + matches.len[1];
		}
	} while(matches.pos[1]);
	return result;
}
</cfscript>