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
 * Generates a structure of days for the week, including the beginning and end of the week.
 * Rewrite by Raymond Camden
 * 
 * @param date 	 Date to use. Defaults to this week. 
 * @return Returns a structure. 
 * @author Rich Rein (richard.rein@medtronic.com) 
 * @version 2, February 25, 2002 
 */
function thisWeek() {
	var dayOrdinal = 0;
	var returnStruct = structNew();
	var current_date = now();
	
	if (arrayLen(arguments)) current_date = arguments[1];
	dayOrdinal = DayOfWeek(current_date);
	
	returnStruct.weekBegin = dateAdd("d",-1 * (dayOrdinal-1), current_date);
	returnStruct.weekEnd = dateAdd("d",7-dayOrdinal, current_date);
	returnStruct.weekNo = Week(returnStruct.weekBegin);
	
	for(i=1; i LTE 7; i=i+1) {
		StructInsert(returnStruct,DayOfWeekAsString(i),dateAdd("d",i-1,returnStruct.weekBegin));
	}
	
	return returnStruct;

}
</cfscript>