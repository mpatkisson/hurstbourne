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
 * Strips characters that cause line wrap when exporting.
 * 
 * @param s 	 String to modify. (Required)
 * @return Returns a string. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 0, December 13, 2010 
 */
function singleLine(s){
	s = replacelist(s, "#chr(9)#,#chr(10)#,#chr(12)#,#chr(13)#,#chr(160)#", " , , , , ");
	return trim(reReplace(s, "[[:space:]]{2,}", " ", "all"));
}
</cfscript>