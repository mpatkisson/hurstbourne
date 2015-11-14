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
 * Returns the nearest half hour based on minutes of the hour supplied to the function.
 * 
 * @param minutes 	 Number of minutes past the hou for which you want to calculate the nearest half hour. (Required)
 * @return Returns a numeric value. 
 * @author Jason Smith (jason@inwebsys.net) 
 * @version 1, March 10, 2003 
 */
function GetHalfHour(minutes) {
  var min_diff = abs(30 - minutes);
  var half_hour = 0;
  if (minutes lte 30) {
    if (min_diff gte 15) { half_hour = "00"; }
	else { half_hour = "30"; }
  } 
  else if (minutes gt 30) {
    if (min_diff gte 15) { half_hour = "00"; }
	else { half_hour = "30"; }
  }
  return half_hour;
}
</cfscript>