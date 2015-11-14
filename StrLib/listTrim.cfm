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
 * Returns the list which was passed in after having trimmed each list item.
 * 
 * @param ThisList 	 List to trim. (Required)
 * @param ThisDelimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, May 8, 2006 
 */
function listTrim(ThisList) {
	var i = 0;
	var ThisDelimiter = ",";
	var ThisListItem = "";
	var ThisTrimmedList = "";
		
	// check for passed delimiter
	if(ArrayLen(Arguments) EQ 2){
		ThisDelimiter = Arguments[2];
	}
	for(i = 1; i LTE ListLen(ThisList,ThisDelimiter); i = i + 1){
		ThisListItem	= Trim(ListGetAt(ThisList,i,ThisDelimiter));
		ThisTrimmedList = ListAppend(ThisTrimmedList,ThisListItem,ThisDelimiter);
	}
	return ThisTrimmedList;
}
</cfscript>