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
 * Adds formatting to list elements, for displaying lists in a more readable fashion.
 * 
 * @param theList 	 The list to modify. (Required)
 * @param beginStr 	 The string to prepend to each list element. (Required)
 * @param endStr 	 The string to append to each list element. (Required)
 * @param theDelim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function ListFormatted(theList, beginStr, endStr) {
	var theDelim = ",";
	if(ArrayLen(Arguments) GTE 4) theDelim = Arguments[4];

	return beginStr & Replace(theList, theDelim, endStr & beginStr, "ALL") & endStr;
}
</cfscript>