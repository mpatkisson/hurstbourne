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
 * Returns the day of the month(1-31) of an Nth Occurrence of a day (1-sunday,2-monday etc.)in a given month.
 * 
 * @param NthOccurrence 	 A number representing the nth occurrence.1-5. 
 * @param TheDayOfWeek 	 A number representing the day of the week (1=Sunday, 2=Monday, etc.). 
 * @param TheMonth 	 A number representing the Month (1=January, 2=February, etc.). 
 * @param TheYear 	 The year. 
 * @return Returns a numeric value. 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 1, August 28, 2001 
 */
function GetNthOccOfDayInMonth(NthOccurrence,TheDayOfWeek,TheMonth,TheYear)
{
  Var TheDayInMonth=0;
  if(TheDayOfWeek lt DayOfWeek(CreateDate(TheYear,TheMonth,1))){
    TheDayInMonth= 1 + NthOccurrence*7  + (TheDayOfWeek - DayOfWeek(CreateDate(TheYear,TheMonth,1))) MOD 7;
  }
  else{
    TheDayInMonth= 1 + (NthOccurrence-1)*7  + (TheDayOfWeek - DayOfWeek(CreateDate(TheYear,TheMonth,1))) MOD 7;
  }
  //If the result is greater than days in month or less than 1, return -1
  if(TheDayInMonth gt DaysInMonth(CreateDate(TheYear,TheMonth,1)) OR   TheDayInMonth lt 1){
    return -1;
  }
  else{
    return TheDayInMonth;
  }
}
</cfscript>