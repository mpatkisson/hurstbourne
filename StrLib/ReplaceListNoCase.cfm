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
 * Replace all occurences of elements in list one with elements in list two. Case insensitive version of ReplaceList.
 * Modified by Raymond Camden
 * 
 * @param str 	 The string to modify. 
 * @param list1 	 The list of terms to search for. 
 * @param list2 	 The list of corresponding items to use as replacements. 
 * @return Returns a modified list. 
 * @author Matthew Walker (matthew@electricsheep.co.nz) 
 * @version 2, December 11, 2001 
 */
function ReplaceListNoCase(str,list1,list2) {
	var i = 1;
	var newval = "";
	for(; i lte listLen(list1); i=i+1) {
		if(i gt listLen(list2)) newval = "";
		else newval = listGetAt(list2,i);
		str = ReplaceNoCase(str,listGetAt(list1,i),newval,"all");		
	}
	return str;
}
</cfscript>