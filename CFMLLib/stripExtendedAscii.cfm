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
 * Removes all extended and non-printing ASCII characters from a string.
 * v2 by Adam Cameron
 * 
 * @param str 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Kevin Benore (Kevin@Benore.net) 
 * @version 2, August 30, 2011 
 */
function stripExtendedAscii(str) {
  return reReplace(arguments.str, "[^\x20-\x7E]", "", "ALL"); // 0x20 = space, chr(32); \0x7E = ~ / tilde, chr(126)
};
</cfscript>