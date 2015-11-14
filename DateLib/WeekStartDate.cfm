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
 * Takes a week number and returns a date object of the first day of that week.
 * Added ISOFormat, RCamden, 3/19/2002
 * 
 * @param weekNum 	 The week number. 
 * @param weekYear 	 The year. 
 * @param ISOFormat 	 Use ISO for first day of week. Defaults to false. 
 * @return Returns a date object. 
 * @author David Murphy (dmurphy52@lycos.com) 
 * @version 1, March 19, 2002 
 */
function weekStartDate(weekNum,weekYear) {
	var weekDate = dateAdd("WW",weekNum-1,"1/1/" & weekYear);
	var toDay1 = dayofweek(weekDate)-1;
	var weekStartDate = dateAdd("d",-toDay1,weekDate);
	if(arrayLen(arguments) gte 3 and arguments[3]) weekStartDate = dateAdd("d",1,weekStartDate);
	return weekStartDate;	
 }
</cfscript>