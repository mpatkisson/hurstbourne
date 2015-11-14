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
 * Deletes n elements starting at the specified start position.
 * Modified by RCamden
 * 
 * @param list 	 The list to modify. 
 * @param startPos 	 The starting position. 
 * @param numElements 	 Number of items to delete, including item at startPos. 
 * @param delimiter 	 The delimiter to use. Defaults to a comma. 
 * @return Returns a string. 
 * @author Shaun Ambrose (shaun.ambrose@arcorsys.com) 
 * @version 1, April 24, 2002 
 */
function ListDeleteMid(list, startPos, numElements) {
	var i=0;
	var delimiter=",";
	var finish=startPos+numElements-1;

	if (Arraylen(arguments) gt 3) {
		delimiter=arguments[4];
	}
	if (finish gt ListLen(list, delimiter)) {
    	finish = listLen(list,delimiter);
  	}
	for (i=startPos; i lte finish; i=i+1) {
		list=listDeleteAt(list, startpos, delimiter);
	}
	return list;
}
</cfscript>