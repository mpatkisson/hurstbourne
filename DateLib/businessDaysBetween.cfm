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
 * Calculates the number of business days between 2 dates.
 * 
 * @param date1 	 First date. (Required)
 * @param date2 	 Second date. (Required)
 * @return Returns a number. 
 * @author Harry Goldman (harry@icn.net) 
 * @version 1, April 10, 2008 
 */
function businessDaysBetween(date1,date2) {
	var numberOfDays = 0;
	
	while (date1 LT date2) {
		date1 = dateAdd("d",1,date1);
		if(dayOfWeek(date1) GTE 2 AND dayOfWeek(date1) LTE 6) numberOfDays = incrementValue(numberOfDays);
	}

	return numberOfDays;
}
</cfscript>