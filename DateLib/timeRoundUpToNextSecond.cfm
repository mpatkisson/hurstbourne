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
 * corrects rounding errors for times brought in from Excel
 * 
 * @param datetime 	 datetime (Required)
 * @return returns a string 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 0, May 9, 2009 
 */
function timeRoundUpToNextSecond(datetime){
	// Declare our local variables
	var lDiff = 0;	
	
	// Correct for rounding error. If the milliseconds are something like .997,
	// I am asserting (assuming?) that the actual time is really the next second.
	// Why bother? I have Excel worksheets where the datetime is "4/13/09 17:00"
	// but when brought into CF via POI, it gets turned into "4/13/09 16:59:59"
	
	if(datePart("l", datetime) gte 997)
		{
		lDiff = 1000 - datePart("l", datetime);
		lDiff = lDiff / 1000;
		lDiff = lDiff + 1;
		datetime = dateAdd("s",lDiff,datetime); 
	};

	return datetime;
}
</cfscript>