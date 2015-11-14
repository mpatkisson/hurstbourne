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
 * Converts struct into delimited key/value list.
 * 
 * @param s 	 Structure. (Required)
 * @param delim 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Greg Nettles (gregnettles@calvarychapel.com) 
 * @version 2, July 25, 2006 
 */
function structToList(s) {
	var delim = "&";
	var i = 0;
	var newArray = structKeyArray(arguments.s);

	if (arrayLen(arguments) gt 1) delim = arguments[2];

	for(i=1;i lte structCount(arguments.s);i=i+1) newArray[i] = newArray[i] & "=" & arguments.s[newArray[i]];

	return arraytoList(newArray,delim);
}
</cfscript>