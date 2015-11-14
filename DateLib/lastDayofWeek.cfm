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
 * Returns last day of the week, assumes Saturday is the last day.
 * Modded by RCamden to support default date
 * 
 * @param date 	 Date to base 'next Saturday' on. Defaults to now(). (Optional)
 * @return Returns a date. 
 * @author Randy Johnson (randy@cfconcepts.com) 
 * @version 1, August 30, 2010 
 */
function lastDayOfWeek() {
     var NumberOfDays="";
     var LastDayOfWeek = "";
     if(arrayLen(arguments) is 0) arguments.date = now();
     else arguments.date = arguments[1];
     date = trim(arguments.date);
	
     NumberOfDays = 7 - dayOfWeek(date);

     LastDayOfWeek = dateAdd("d", NumberOfDays, date);
    
     return LastDayOfWeek;
}
</cfscript>