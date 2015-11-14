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
 * Returns a time range for a particular date from midnight to 11:59:59 the same day except for Monday.
 * 
 * @param dateIn 	 Date value to use for range. (Required)
 * @return Returns a string. 
 * @author Dharmesh Goel (drgoel@yahoo.com) 
 * @version 1, April 4, 2007 
 */
function dailyBusinessReportDateRange(dateIn) {
	var dateRange = "";
	var dateOut1 = "";
	var dateOut2 = "";
	
	dateIn = dateFormat(dateIn, 'MM/DD/YYYY');
	
	if(dayOfWeek(dateIn) EQ 2) {
		dateOut1 = dateAdd("d",-2,dateIn);
		dateOut2 = dateadd("s",-1,dateAdd("d",1,dateIn));
	} else {
		dateOut1 = dateAdd("d",0,dateIn);
		dateOut2 = dateadd("s",-1,dateAdd("d",1,dateIn));
	}
	dateRange = dateout1 & "," & dateOut2;

	return dateRange;
}
</cfscript>