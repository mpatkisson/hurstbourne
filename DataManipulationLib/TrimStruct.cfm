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
 * Trims spaces from all keys in a structure.
 * Version 2 by Raymond Camden
 * Version 3 by author - he mentioned the need for isSimpleValue
 * 
 * @param st 	 Structure to trim. (Required)
 * @param excludeList 	 List of keys to exclude. (Optional)
 * @return Returns a structure. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 3, July 11, 2002 
 */
function TrimStruct(st) {
	var excludeList = "";
	var key = "";

	if(arrayLen(arguments) gte 2) excludeList = arguments[2];
	for(key in st) {
		if(not listFindNoCase(excludeList,key) and isSimpleValue(st[key])) st[key] = trim(st[key]);
	}
	return st;
}
</cfscript>