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
 * Works just like dateAdd(), except it only adds business days
 * Version 2 by Steven Van Gemert, svg2@placs.net
 * 
 * @param date 	 Date you want to add business days to. (Required)
 * @param number 	 Number of business days to add to date. (Required)
 * @return Returns a date object. 
 * @author Billy Cravens (billy@architechx.com) 
 * @version 2, August 10, 2005 
 */
function businessDaysAdd(date,number) {
  var cAdded = 0;
  var tempDate = date;
  var direction = compare(number,0);
  while (cAdded LT abs(number)) {
	tempDate = dateAdd("d",direction,tempDate);
    if (dayOfWeek(tempDate) GTE 2 AND dayOfWeek(tempDate) LTE 6) {
      cAdded = incrementValue(cAdded);
    }
  }
  return tempDate;
}
</cfscript>