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
 * Returns a date for Memorial Day in a given year.
 * This function requires the GetLastOccOfDayInMonth() function available from the DateLib library. Minor modifications by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param TheYear 	 The year you want to return Columbus Day for. 
 * @return Returns a date object. 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 1, August 28, 2001 
 */
//Memorial Day:last monday in may
function GetMemorialDay()
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  return CreateDate(TheYear,5,GetLastOccOfDayInMonth(2,5,TheYear));
}
</cfscript>