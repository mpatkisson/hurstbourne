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
 * Returns the number of specific days between a start and end date - i.e. weekdays or workdays.
 * 
 * @param startdate 	 Starting date. (Required)
 * @param enddate 	 Ending date. (Required)
 * @param exclude 	 Days of the week (as a number) to include. Defaults to 1,7 (Optional)
 * @param includeStartDate 	 Boolean value to indicate if startdate is included in count. Defaults to true. (Optional)
 * @return Returns a number. 
 * @author Isaac Dealey (info@turnkey.to) 
 * @version 1, December 5, 2006 
 */
function countArbitraryDays(startdate,enddate) { 
	var exclude = "1,7"; var IncludeStartDate = true; 
	var daysperweek = 0; var days = 0; 
	var weekday = ArrayNew(1); var x = 0; 
	var maxdays = DateDiff("d",dateadd("d",-1,startdate),enddate); 
	
	switch (arrayLen(arguments)) { 
		case 4: { IncludeStartDate = arguments[4]; } 
		case 3: { exclude = arguments[3]; } 
	} 
	
	// create an array to hold days of the week with 1 or 0 indicating if the day is counted 
	arraySet(weekday,1,7,1); exclude = listToArray(exclude); 
	for (x = 1; x lte arrayLen(exclude); x = x + 1) { weekday[exclude[x]] = 0; } // set the value of any excluded day to 0 
	daysperweek = arraySum(weekday); // count the number of included days in a full week 
	days = daysperweek * int(maxdays/7); // get the number of included days in all full weeks 
	for (x = 1; x lte maxdays mod 7; x = x + 1) { // add any remaining days in the last partial week 
		days = days + weekday[dayofweek(enddate)]; 
		enddate = dateadd("d",-1,enddate); 
	} 
	
	// if excluding the start date, remove the value that might have been added for the starting day 
	if (not includeStartDate) { days = days - weekday[dayofweek(startdate)]; } 
	
	return days; 
}
</cfscript>