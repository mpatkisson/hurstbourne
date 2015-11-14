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
 * Calculates time from seconds after midnight.
 * Minor modifications by Rob Brooks-Bilson (rbils@amkor.com).
 * v2 by Raymond Camden to support seconds over one day
 * 
 * @param seconds 	 Number of seconds from midnight used to calculate the time. (Required)
 * @return Returns a date/time object. 
 * @author Seth Duffey (sduffey@ci.davis.ca.us) 
 * @version 2, March 11, 2009 
 */
function getTimeFromSeconds(seconds) {
	var timehr = "";
	var timemin = "";
	var timesec = "";
	
	//roll days
	if(seconds gt 86400) seconds = seconds-((seconds \ 86400) * 86400);

	TimeHr = (((seconds\3600)-1) Mod 24)+1; /* find hour */
	TimeMin = seconds\60-(seconds\3600)*60; /* Find minutes */
	TimeSec = seconds-(TimeHr * 3600) - (TimeMin*60); /* find seconds */
	return createTime(TimeHr,TimeMin,TimeSec); /* Create time (no date) */
}
</cfscript>