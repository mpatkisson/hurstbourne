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
 * Returns the interval since a date in a Twitter like format (e.g. 5 minutes ago)
 * version 0.9 by Simon Bingham
 * version 1.0 by Adam Cameron - tweaked to correct pluralisation when the interval value was 1.
 * 
 * @param date 	 Date to format (Required)
 * @return Returns a string 
 * @author Simon Bingham (me@simonbingham.me.uk) 
 * @version 1, July 27, 2012 
 */
function getTimeInterval(date){
	var interval	= "";
	var offset		= 0;
	var result		= 0;
	if (isDate(arguments.date)){
		var formattedDate = dateFormat(arguments.date, "dddd dd mmmm yyyy") & " at " & timeFormat(arguments.date, "HH:MM");
		
		if (dateDiff("s", arguments.date, now()) < 60){
			// less than 1 minute show interval in seconds
			offset	= dateDiff("s", arguments.date, now());
			interval= offset == 1 ? "second":"seconds";
			result	= "#offset# #interval# ago";
		
		}else if (dateDiff("n", arguments.date, now()) < 60){
			// less than 1 hour show interval in minutes
			offset	= dateDiff("n", arguments.date, now());
			interval= offset == 1 ? "minute":"minutes";
			result	= "#offset# #interval# ago";
		
		}else if (dateDiff("h", arguments.date, now()) < 24){
			// less than 24 hours display interval in hours
			offset	= dateDiff("h", arguments.date, now());
			interval= offset == 1 ? "hour":"hours";
			result	= "#offset# #interval# ago";
		
		}else if (dateDiff("d", arguments.date, now()) < 2){
			// less than 2 days display yesterday
			result	= "yesterday";
		}else if (dateDiff("d", arguments.date, now()) < 7){
			// less than 7 days display day
			result	= dayOfWeekAsString( dayOfWeek( arguments.date ));
		}else{
			// otherwise display date
			result	= formattedDate;
		}
		
		interval = "<abbr title='" & formattedDate & "'>" & result & "</abbr>";
	}
	return interval;
}
</cfscript>