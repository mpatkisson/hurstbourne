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
 * Returns the number of weekdays between two dates.
 * 
 * @param date1 	 Start date for the date range.  Can take any valid CF date format. 
 * @param date2 	 End date for the date range.  Can take any valid CF date format. 
 * @return Returns a numeric value. 
 * @author Dan Anderson (udf@sr77.com) 
 * @version 1.0, October 9, 2001 
 */
function weekdays(date1,date2){
  //initialize variables
  var wday=0;
  var day=0;
  var numdays=0;
  
  //get total number of days in between days and save it in numdays
  numdays=datediff("d",date1,date2);
  //loop through all the days between the dates.
  for (day=0; day lte numdays; day=day+1){
  
   if(dayofweek(dateadd("d",day,date1)) neq 1 and dayofweek(dateadd("d",day,date1)) neq 7){
   //if the day is neither saturday or sunday add a week day.
   wday=wday+1;}
  } 
 return wday;
 }
</cfscript>