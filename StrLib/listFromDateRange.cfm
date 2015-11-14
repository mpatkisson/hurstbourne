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
 * ListFromDateRange returns a list of dates given a starting and ending date.
 * 
 * @param date1 	 First date to use. (Required)
 * @param date2 	 Second date to use. (Required)
 * @param thisDelimiter 	 List delimiter to use for result. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, February 13, 2006 
 */
function listFromDateRange (date1,date2) {
	var i 				= 0;
	var numberOfDays	= 0;
	var thisDate	 	= "";
	var theList			= "";
	var temp			= "";
	var thisDelimiter	= ",";

	if(arraylen(arguments) eq 3) thisDelimiter = trim(arguments[3]);
	
	if (date1 GT date2) {
		temp	= date1;
		date1	= date2;
		date2	= temp;
	}

	numberOfDays = dateDiff("d",date1,date2);
	
	for(i = 0; i lte NumberOfDays; i = i + 1){
		thisDate = dateAdd("d",i,date1);
		theList = listAppend(theList,thisDate,thisDelimiter);
	}
	
	return theList;
}
</cfscript>