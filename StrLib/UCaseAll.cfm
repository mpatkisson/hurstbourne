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
 * Returns a string with all words capitalized with special non english characters.
 * 
 * @param str 	 The string to format. (Required)
 * @return Returns a string. 
 * @author Ivan Rodriguez (ivan.rodriguez@de-net.net) 
 * @version 1, May 14, 2002 
 */
function UCaseAll(str){
	var newstr = "";
	var list1 ="?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,";
	var list2 = "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?";

	newstr = Ucase(str);
	newstr = ReplaceList(newstr,list1,list2);
	return newstr;
}
</cfscript>