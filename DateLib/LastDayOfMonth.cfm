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
 * Returns a date object representing the last day of the given month.
 * 
 * @param strMonth 	 Month you want to get the last day for, (Required)
 * @param strYear 	 Year for the specified month.  Useful for leap years.  The default is the current year. (Optional)
 * @return Returns a date object. 
 * @author Ryan Kime (ryan.kime@somnio.com) 
 * @version 1, May 7, 2002 
 */
function LastDayOfMonth(strMonth) {
  var strYear=Year(Now());
  if (ArrayLen(Arguments) gt 1)
    strYear=Arguments[2];
  return DateAdd("d", -1, DateAdd("m", 1, CreateDate(strYear, strMonth, 1)));
}
</cfscript>