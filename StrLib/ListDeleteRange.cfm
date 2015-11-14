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
 * This function deletes a range of items from a list.
 * 
 * @param list 	 The list to modify. 
 * @param from 	 The position to begin deleting. 
 * @param to 	 The position to stop deleting.  
 * @param delimiter 	 The delimiter to use. Defaults to a comma. 
 * @return Returns a string. 
 * @author Shaun Ambrose (shaun.ambrose@arcorsys.com) 
 * @version 1, April 24, 2002 
 */
function ListDeleteRange(list, from, to) {
	var delimiter = ",";
	var i = from;
		
	if(arrayLen(arguments) gt 3) {
		delimiter = arguments[4];
	}
	
	if(to gt listLen(list,delimiter)) to = listLen(delimiter);
	
	for(; i lte to; i=i+1) {	
		list=listDeleteAt(list, from, delimiter);
	}

	return list;
}
</cfscript>