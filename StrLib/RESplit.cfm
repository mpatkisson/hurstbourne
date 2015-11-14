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
 * Splits a string into arrays based on a regex.
 * Fix for missing end item by Thomas Muck (tommuck@basic-drumbeat.com)
 * 
 * @param str 	 The string to search. 
 * @param regex 	 The regular expression to split on. 
 * @return Returns an array. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, January 29, 2002 
 */
function RESplit(str,regex) {
	var results = arrayNew(1);
	var test = REFind(regex,str,1,1);
	var pos = test.pos[1];
	var oldpos = 1;
	if(not pos) results[1] = str;
	while(pos gt 0) {
		arrayAppend(results,mid(str,oldpos,pos-oldpos));
		oldpos = pos+test.len[1];
		test = REFind(regex,str,oldpos+1,1);
		pos = test.pos[1];
	}
        //Thanks to Thomas Muck
        if(len(str) GT oldpos) arrayappend(results,right(str,len(str)-oldpos + 1));
	return results;
}
</cfscript>