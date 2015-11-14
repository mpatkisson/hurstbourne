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
 * Limit a string's output to the desired length.
 * 
 * @param string 	 The string to modify. 
 * @param length 	 The max length to use. 
 * @return Returns a string. 
 * @author John Reed (johnreed1972@yahoo.com.au) 
 * @version 1, February 24, 2002 
 */
function maxLength(string, length) {
	var padding = 3;
	var tmp = "...";	
		
	if ( len(string) gte length )
		return removeChars(trim(string), length, len(string) - padding) & tmp;
	else return string;
}
</cfscript>