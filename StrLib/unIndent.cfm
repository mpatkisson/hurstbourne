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
 * Un-indents strings but preserves formatting
 * 
 * @param str 	 String to be modified (Required)
 * @return returns a string 
 * @author Nathan Strutz (strutz@gmail.com) 
 * @version 0, March 7, 2009 
 */
function unIndent(str) {
	var lines = str.split("\n");
	var i = 0;
	var minSpaceDist = 9999;
	var newStr = "";

	for(i=1; i lte arrayLen(lines); i=i+1) {
		if (len(trim(lines[i]))) {
			minSpaceDist = max( min(minSpaceDist, reFind("[\S]",lines[i])-1), 0);
		}
	}

	for(i=1; i lte arrayLen(lines); i=i+1) {
		newStr = newStr & removeChars(lines[i], 1, minSpaceDist) & chr(10);
	}
	return newStr;
}
</cfscript>