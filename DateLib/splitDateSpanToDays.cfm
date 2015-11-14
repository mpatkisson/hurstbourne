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
 * Splits date span to array of days (periods)
 * 
 * @param spanStart 	 Start date (Required)
 * @param spanEnd 	 End date (Required)
 * @return Returns an array. 
 * @author Rodion Bykov (rodionbykov@gmail.com) 
 * @version 0, March 18, 2010 
 */
function splitDateSpanToDays(spanStart, spanEnd){

	var result = arrayNew(1);
	var period = structNew();
	var firstDayStart = now();
	var firstDay = arguments.spanStart;
	var firstDayEnd = createDateTime(year(firstDay), month(firstDay), day(firstDay), 23, 59, 59);
	var currentDay = now();
	var lastDayStart = now();
	var lastDay = arguments.spanEnd;
	var lastDayEnd = createDateTime(year(lastDay), month(lastDay), day(lastDay), 23, 59, 59);
	var daysBetween = 0;
	var i = 0;
	
	if (dayOfYear(firstDay) eq dayOfYear(lastDay)) {
		period = structNew();
		period.start = firstDay;
		period.end = lastDay;
		temp = arrayAppend(result, period);
	}else{
		firstDayStart = createDateTime(year(firstDay), month(firstDay), day(firstDay), 0, 0, 0);
		lastDayStart = createDateTime(year(lastDay), month(lastDay), day(lastDay), 0, 0, 0);
		daysBetween = dateDiff("d", firstDayStart, lastDayStart) - 1;
		
		period = structNew();
		period.start = firstDay;
		period.end = firstDayEnd;
		temp = arrayAppend(result, period);
		
		if (daysBetween gt 0) {
			for (i = 1; i lte daysBetween; i = i + 1) {
				period = structNew();
				currentDay = dateAdd("d", i, firstDayStart);
				period.start = currentDay;
				currentDay = dateAdd("d", i, firstDayEnd);
				period.end = currentDay;
				temp = arrayAppend(result, period);
			}
		}
		
		period = structNew();
		period.start = lastDayStart;
		period.end = lastDay;
		temp = arrayAppend(result, period);
		
	}
	
	return result;
}
</cfscript>