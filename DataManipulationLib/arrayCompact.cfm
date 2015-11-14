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
 * Used to remove missing positions from an array.
 * 
 * @param arr 	 Array to compact. (Required)
 * @param delim 	 Temporary list delimiter. Defaults to |. (Optional)
 * @return Returns an array. 
 * @author M Gillespie for HOUCFUG (houcfug@yahoogroups.com) 
 * @version 1, March 2, 2007 
 */
function arrayCompact(arr) {
	var delim="|";
	if(arraylen(arguments) gt 1) {delim=arguments[2];}
	return listtoarray(arraytolist(arr,delim),delim);
}
</cfscript>