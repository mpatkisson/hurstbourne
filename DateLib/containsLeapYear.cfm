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
 * Function that determines if a given date range contains a leap year.
 * 
 * @param startDate 	 Initial date. (Required)
 * @param endDate 	 Ending date. (Required)
 * @return Returns a boolean. 
 * @author Mosh Teitelbaum (mosh.teitelbaum@evoch.com) 
 * @version 1, May 26, 2003 
 */
function containsLeapYear(startDate, endDate) {
	// Build offsets
	var StartDateYearOffset = DateAdd("yyyy", 1, startDate);
	var StartDateYearOffsetInDays = DateDiff("d", startDate, StartDateYearOffset);
	var EndDateYearOffset = DateAdd("yyyy", 1, Trim(endDate));
	var EndDateYearOffsetInDays = DateDiff("d", endDate, EndDateYearOffset);

	// Return result
	return IIf(StartDateYearOffsetInDays - EndDateYearOffsetInDays GT 0, DE("true"), DE("false"));
}
</cfscript>