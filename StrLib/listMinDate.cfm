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
 * Checks a list of dates for the minimum date.
 * v2 by Steven Van Gemert
 * 
 * @param dtList 	 List to search. (Required)
 * @param delim 	 Delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a date. 
 * @author Ann Terrell (ann@landuseoregon.com) 
 * @version 2, January 16, 2007 
 */
function listMinDate(ThisDateList) {
	var ThisDelimiter = ",";
	var ThisDateListLength = "";
	var ThisMinDate = "";
	var i = "";
  
	if(arrayLen(arguments) GTE 2) ThisDelimiter = Arguments[2];

	ThisDateListLength = ListLen(ThisDateList, ThisDelimiter);
	ThisMinDate = ListFirst(ThisDateList, ThisDelimiter);
  
	for (i=1; i LTE ThisDateListLength; i=i+1){
 		if(DateCompare(ListGetAt(ThisDateList, i, ThisDelimiter), ThisMinDate) IS -1) {
			ThisMinDate = ListGetAt(ThisDateList, i, ThisDelimiter);
	   	}
	  }
  
	return ThisMinDate;
}
</cfscript>