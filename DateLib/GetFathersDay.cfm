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
 * Return a date for Father's Day in a given year.  If no year is specified, defaults to the current year.
 * This function requires the GetNthOccOfDayInMonth() function available from the DateLib library. Minor modifications by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param TheYear 	 The year you want to return Father's Day for. 
 * @return Returns a date object 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 1.0, August 22, 2001 
 */
//Father's:third sunday in june
function GetFathersDay() 
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return CreateDate(TheYear,6,GetNthOccOfDayInMonth(3,1,6,TheYear));
}
</cfscript>