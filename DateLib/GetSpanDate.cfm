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
 * Adds a timespan to a date.

GetSpanDate(dateObj, days, hours, minutes, seconds)

Pass in a date object, with the span difference of days, hours, minutes, and seconds and returns a timestamp of the end of the span.
 * 
 * @param dateObj  	 ColdFusion date object to use as the starting date. 
 * @param days 	 Number of days in the timespan 
 * @param hours 	 Number of hours in the timespan 
 * @param minutes 	 Number of minutes in the timespan. 
 * @param seconds 	 Number of seconds in the timespan. 
 * @return Returns a date/time object. 
 * @author Chris Wigginton (cwigginton@macromedia.com) 
 * @version 1, December 12, 2001 
 */
function GetSpanDate(dateObj, days, hours, minutes, seconds){
  var timeDiff = CreateTimeSpan(days, hours, minutes, seconds);
  var spanDate = dateObj+timeDiff;
  return "{ts '" & DateFormat(spanDate, "yyyy-mm-dd ") & TimeFormat(spanDate, "HH:mm:ss") & "'}";
}
</cfscript>