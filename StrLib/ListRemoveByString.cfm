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
 * Removes values from a list by string pattern.
 * Mods by RCamden
 * 
 * @param list 	 The list to modify. (Required)
 * @param str 	 The string to look for. (Required)
 * @param mode 	 If true, removes matches. If false, keeps matches. The default is true. (Optional)
 * @param delim 	 The delimiter to use. Default is comma. (Optional)
 * @return Returns a string. 
 * @author Markus Schneebeli (markus.schneebeli@inm.ch) 
 * @version 2, June 21, 2002 
 */
function ListRemoveByString(list, str) {
	var i = listLen(list);
	var mode = true;
	var delim = ",";
	
	if(arrayLen(arguments) gte 3) mode = arguments[3];
	if(arrayLen(arguments) gte 4) delim = arguments[4];
	
	for (i=ListLen(list, delim); i gte 1 ; i=i-1) {
		if(  (mode and findNoCase(str,listGetAt(list,i,delim))) or (not mode and not findNoCase(str,listGetAt(list,i,delim)))) list = listDeleteAt(list,i,delim);
	}
	return list;
}
</cfscript>