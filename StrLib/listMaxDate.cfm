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
 * Checks a list of dates for the maximum date.
 * v2 by Steven Van Gemert
 * 
 * @param dtList 	 List to check. (Required)
 * @param delim 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns a date if at least one found, or returns an empty string. 
 * @author Ann Terrell (ann@landuseoregon.com) 
 * @version 2, January 16, 2007 
 */
function listMaxDate(ThisDateList) {
	var ThisDelimiter = ",";
	var ThisDateListLength = "";
	var ThisMaxDate = "";
	var i = "";
  
	if(ArrayLen(Arguments) GTE 2) ThisDelimiter = Arguments[2];
  
	ThisDateListLength = ListLen(ThisDateList, ThisDelimiter);
	ThisMaxDate = ListFirst(ThisDateList, ThisDelimiter);
  
	for (i=1; i LTE ThisDateListLength; i=i+1){
		if(DateCompare(ThisMaxDate,  ListGetAt(ThisDateList, i, ThisDelimiter)) IS -1) {
			ThisMaxDate = ListGetAt(ThisDateList, i, ThisDelimiter);
		}
	}
  
	return ThisMaxDate;
}
</cfscript>