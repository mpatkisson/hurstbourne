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
 * Length of list including empty elements.
 * 
 * @param list 	 List to parse. (Required)
 * @param delimiters 	 List delimiters. Only one character allow.  Defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author Tom Litt (tom@oxbowbooks.com) 
 * @version 1, September 29, 2003 
 */
function listLenIncNulls(list) {
	var delimiter = ",";
	if(arrayLen(Arguments) GT 1) delimiter = left(arguments[3],1);
	return val(len(list) - len(replace(list,delimiter,"","ALL")) + 1);
}
</cfscript>