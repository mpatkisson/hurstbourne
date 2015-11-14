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
 * Returns a string with a mixed fraction of quarters.
 * 
 * @param minutes 	 The number of minutes. (Required)
 * @return Returns a string. 
 * @author Dave Babbitt (dave@babbitt.org) 
 * @version 1, September 23, 2004 
 */
function QuarterHour(minutes) {
	var mixedFraction = "";
	var hours = 0;
	var quarterHours = 0;
	
	/* Get hours and let minutes be the remainder */
	hours = Int(minutes/60);
	minutes = minutes - hours*60;

	/* 15 minutes is a "quarter hour" - round up to the nearest one */
	quarterHours = Round(minutes/15);
	if(quarterHours GTE 4) {
		quarterHours = 0;
		hours = IncrementValue(hours);
	}

	/* Build the mixed fraction */
	if(quarterHours GT 0) {
		if(quarterHours EQ 2) mixedFraction = ' 1/2';
		else mixedFraction = ' ' & quarterHours & '/4';
	} else mixedFraction = '';

	mixedFraction = hours & mixedFraction;
	return mixedFraction;
}
</cfscript>