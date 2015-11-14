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
 * Get a count on searching string in the searched string.
 * Updated by Raymond Camden
 * 
 * @param str 	 The string to search. (Required)
 * @param c 	 The string to look for. (Required)
 * @return Returns a numeric value. 
 * @author Peini Wu (pwu@hunter.com) 
 * @version 1, October 17, 2003 
 */
function CountIt(str, c) {
	var pos = findnocase(c, str, 1);
	var count = 0;

	if(c eq "") return 0;
	
	while(pos neq 0){
		count = count + 1;
		pos = findnocase(c, str, pos+len(c));
	}
	
	return count;
}
</cfscript>