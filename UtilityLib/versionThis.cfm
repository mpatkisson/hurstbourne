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
 * Increments the values of a 3 place version number.
 * Version 2 by Raymond Camden
 * 
 * @param version 	 String in the form of a version number, as in x.x.x. (Required)
 * @return Returns a string. 
 * @author Byron Bignell (byronj@bignell.com) 
 * @version 2, June 12, 2003 
 */
function versionThis(str){
	str = replace(str,".","","all") + 1;
	str = left(str,len(str) - 2) & "." & mid(str,len(str)-1,1) & "." & right(str,1);
	return str;
}
</cfscript>