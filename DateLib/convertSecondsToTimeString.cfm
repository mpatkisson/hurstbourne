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
 * Takes a time in seconds argument and converts to a time string in &quot;4d 12h 30m&quot; format.
 * v0.9 by Simon Bingham
 * v1.0 by Adam Cameron. Tweaking small bug if a float is passed-in rather than an integer.
 * 
 * @param timeInSeconds 	 Time in seconds (Required)
 * @param workingHoursPerDay 	 Number of hours to consider "a day" (Optional)
 * @return Returns a string formatting the passed-in seconds value in days, hours and minutes 
 * @author Simon Bingham (me@simonbingham.me.uk) 
 * @version 1.0, September 29, 2012 
 */
public string function convertSecondsToTimeString( required numeric timeInSeconds, string workingHoursPerDay=24 ){
	// create a struct containing placeholder values for days, hours and minutes
	var timeStruct = { days=0, hours=0, minutes=0 };
	
	// create a variable to store the return value
	var timeAsString = "";
	
	// convert the number of working hours per day to seconds
	var workingSecondsPerDay = arguments.workingHoursPerDay * 3600;
	
	timeInSeconds = int(timeInSeconds); // will give unpredictable results if this is a float
	
	// calculate the number of whole working days and add to the 'days' element of our structure
	timeStruct.days = ( arguments.timeInSeconds - ( arguments.timeInSeconds mod workingSecondsPerDay ) ) / workingSecondsPerDay;
	arguments.timeInSeconds = timeInSeconds mod workingSecondsPerDay;
	
	// calculate the number of hours and add to the 'hours' element of our structure
	timeStruct.hours = ( arguments.timeInSeconds - ( arguments.timeInSeconds mod 3600 ) ) / 3600;
	arguments.timeInSeconds = arguments.timeInSeconds mod 3600;
	 
	// calculate the number of minutes and add to the 'minutes' element of our structure
	timeStruct.minutes = arguments.timeInSeconds / 60;
	
	// build the return string
	if( val( timeStruct.days ) ) timeAsString = timeStruct.days & "d ";
	if( val( timeStruct.hours ) ) timeAsString &= timeStruct.hours & "h ";
	if( val( timeStruct.minutes ) ) timeAsString &= timeStruct.minutes & "m";
	
	// return the string
	return trim( timeAsString );
}
</cfscript>