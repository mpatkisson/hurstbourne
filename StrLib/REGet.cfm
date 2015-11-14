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
 * Returns all the matches of a regex from a string.
 * Bug fix by  Ruben Pueyo (ruben.pueyo@soltecgroup.com)
 * 
 * @param str 	 The string to search. (Required)
 * @param regex 	 The regular expression to search for. (Required)
 * @return Returns an array. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, June 6, 2003 
 */
function REGet(str,regex) {
	var results = arrayNew(1);
	var test = REFind(regex,str,1,1);
	var pos = test.pos[1];
	var oldpos = 1;
	while(pos gt 0) {
		arrayAppend(results,mid(str,pos,test.len[1]));
		oldpos = pos+test.len[1];
		test = REFind(regex,str,oldpos,1);
		pos = test.pos[1];
	}
	return results;
}
</cfscript>