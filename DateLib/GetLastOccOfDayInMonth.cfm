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
 * Returns the day of the month(1-31) of Last Occurrence of a day (1-sunday,2-monday etc.)
in a given month.
 * 
 * @param TheDayOfWeek 	 Ordinal value representing the desired day of the week (1-sunday,2-monday etc.) 
 * @param TheMonth 	 Ordinal value representing the month (1-January, 2-February, etc.) 
 * @param TheYear 	 The year. 
 * @return Returns a numeric value. 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 1.0, August 22, 2001 
 */
function GetLastOccOfDayInMonth(TheDayOfWeek,TheMonth,TheYear) 
{
  //Find The Number of Days in Month
  Var TheDaysInMonth=DaysInMonth(CreateDate(TheYear,TheMonth,1));
  //find the day of week of Last Day
  Var DayOfWeekOfLastDay=DayOfWeek(CreateDate(TheYear,TheMonth,TheDaysInMonth));
  //subtract DayOfWeek
  Var DaysDifference=DayOfWeekOfLastDay - TheDayOfWeek;
  //Add a week if it is negative
  if(DaysDifference lt 0){
    DaysDifference=DaysDifference + 7;
  }
  return TheDaysInMonth-DaysDifference;
}
</cfscript>