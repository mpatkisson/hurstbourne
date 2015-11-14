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
 * Returns the first occurrence of the longest item  in  a list.
 * 
 * @param list 	 The list to parse. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returrns a string. 
 * @author Joseph Flanigan (joseph@switch-box.org) 
 * @version 1, September 21, 2004 
 */
function listLongestItem(list){
	var delim = ","; 
	var item = "";
	var i = 0;
	
	if(arrayLen(arguments) EQ 2) delim = arguments[2];
	for(i = 1 ; i lte listLen(list,delim); i = i + 1 )  {
		if (len(listGetAt(list,i,delim)) gt len(item)) item = listGetAt(list,i,delim); 
	}
	return item; 
}
</cfscript>