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
 * Returns an integer of the days left before Christmas.
 * Version 2 by Ken McCafferty
 * 
 * @return Returns a number. 
 * @author Larry Juncker (ljuncker@aljcompserv.com) 
 * @version 2, October 4, 2002 
 */
function DaysTillChristmas() {
	var ChristmasDayOfYearThisYear =
DayofYear(CreateDate(Year(Now()),12,25));
	var ChristmasDayOfYearNextYear =
DayofYear(CreateDate(Year(Now()) + 1,12,25));
	var TodaysDayOfYear = DayofYear(Now());
	var DaysThisYear=DaysInYear(Now());
	  //Christmas coming
	if (ChristmasDayOfYearThisYear gt TodaysDayOfYear){
	   return ChristmasDayOfYearThisYear -
TodaysDayOfYear;
	}
	 //Christmas has passed
	if (TodaysDayOfYear gt ChristmasDayOfYearThisYear){
	 return DaysThisYear-TodaysDayOfYear +
ChristmasDayOfYearNextYear;
	}
		
	return 0;
}
</cfscript>