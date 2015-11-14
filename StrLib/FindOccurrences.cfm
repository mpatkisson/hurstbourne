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
 * Returns the number of times a pattern exists within a string.
 * Modified by Raymond Camden
 * Rewritten based on original UDF by Cory Aiken (corya@fusedsolutions.com)
 * 
 * @param tString 	 The string to check. 
 * @param tsubString 	 The string to look for. 
 * @return Returns the number of occurrences. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 3, March 20, 2002 
 */
function FindOccurrences(tString,tsubString){
	if(not len(tString) OR not len(tsubString)) return 0;
	else {
		// delete all occurences of tString
		// and then calculate the number of occurences by comparing string sizes
		return ((len(tString) - len(replaceNoCase(tString, tsubString, "", "ALL"))) / len(tsubString));
	}
}
</cfscript>