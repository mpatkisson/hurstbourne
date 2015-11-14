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
 * Returns week number based on [optional] custom start of week day
 * 
 * @param date 	 date to determine week number  (Required)
 * @param weekStart 	 day of week start (1-7) (Optional)
 * @param returnFormat 	 boolean to return week number and year instead of just week number (Optional)
 * @return Returns a string (depends on optional argument). 
 * @author Azadi Saryev (azadi.saryev@gmail.com) 
 * @version 0, March 4, 2010 
 */
function customWeekNumber(date) {
	var firstDayOfWeek = 1;
	var theDate = createdate(year(arguments.date), month(arguments.date), day(arguments.date));
	var firstDayOfYear = createdate(year(theDate), 1, 1);
	var firstCustWeekdayOfYear = "";
	var custWeekNum = 0;
	if (arraylen(arguments) gte 2) firstDayOfWeek = arguments[2];
	if (val(firstDayOfWeek) lt 1 OR val(firstDayOfWeek) gt 7) firstDayOfWeek = 1;
	firstCustWeekdayOfYear = dateadd('d', firstDayOfWeek-dayofweek(firstDayOfYear), firstDayOfYear);
	if (datecompare(theDate, firstCustWeekdayOfYear) lt 0) {
		firstDayOfYear = createdate(year(theDate)-1, 1, 1);
		firstCustWeekdayOfYear = dateadd('d', firstDayOfWeek-dayofweek(firstDayOfYear), firstDayOfYear);
	}
	custWeekNum = ceiling(datediff('d', firstCustWeekdayOfYear, theDate)/7);
	if (NOT custWeekNum) custWeekNum = 1;
	if (arraylen(arguments) gte 3 AND arguments[3]) {
		return numberformat(custWeekNum + year(firstCustWeekdayOfYear)/(1 & repeatstring(0, len(year(firstCustWeekdayOfYear)))), '^.' & repeatstring(0, len(year(firstCustWeekdayOfYear)))); //return weeknumber and year as WW.YYYY 
	} else {
		return custWeekNum; //return weeknumber only
	}
}
</cfscript>