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
 * Formats a date/time value for use on the y-axis in CFCHART.
 * 
 * @param date 	 Date/time value you want formatted for CFCHART. (Required)
 * @return Returns a numeric value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, October 18, 2002 
 */
function cfchartDateFormat() {
  var datetime = 0;
  if (ArrayLen(Arguments) eq 0) {
    datetime = Now();
  }
  else {
    datetime = arguments[1];
  }
  return numberFormat(DateDiff("s", DateConvert("utc2Local", "January 1 1970 00:00"), datetime) * 1000);
}
</cfscript>