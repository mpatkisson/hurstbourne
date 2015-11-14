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
 * Returns the date for Thanksgiving day in a given year.
 * This function requires the GetNthOccOfDayInMonth() function available from the DateLib library.
 * 
 * @param TheDate 	 The year you want to return Thanksgiving day for. 
 * @return Returns a date object. 
 * @author Ken McCafferty (mccjdk@fyi.net) 
 * @version 1.0, September 5, 2001 
 */
// Thanksgiving Day 4th thursday in november
function GetThanksgivingDay() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];

  return CreateDate(TheYear,11,GetNthOccOfDayInMonth(4,5,11,TheYear));
}
</cfscript>