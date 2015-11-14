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
 * Returns a date object representing the next occurrence of the specified day.  The default is the next occurrence of the current day.
 * This function is based on an idea submitted by Larry Juncker (ljuncker@aljcompserv.com).
 * 
 * @param day 	 Ordinal day of the week.  1=Sunday, 2=Monday, 3=Tuesday, etc.   
 * @return Returns a date. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, August 22, 2001 
 */
function  NextOccOfDOW()
{
  Var day = DayOfWeek(Now());
  Var dayOffset = 7;
  if(ArrayLen(Arguments)) 
    day = Arguments[1];
  if(Day GT DayOfWeek(Now()))
    dayOffset = 0;
  return DateAdd("d",(dayOffset + (day - DayOfWeek(Now()))),Now());    
}
</cfscript>