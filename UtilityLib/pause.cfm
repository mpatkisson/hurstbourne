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
 * Simulates a paused state within an executed Coldfusion script.
 * Modified by Raymond Camden
 * 
 * @param TimeDelay 	 Number of seconds to paue. (Required)
 * @param DebugMode 	 If true, outputs debug information about the pause. Defaults to false. (Optional)
 * @return Returns nothing, unless debugmode is on. 
 * @author Tyler Bowler (tyler.bowler@rivhs.com) 
 * @version 1, December 20, 2007 
 */
function pause(TimeDelay) {
	
	//Gets the time the function starts processing for output purposes
	var StartTime = TimeFormat(CreateTime(Hour(Now()),Minute(Now()),Second(Now())), "HH:mm:ss");
	//Converts the start time to seconds 
	var StartTimeInSeconds = Val(Hour(Now()) * 720) + Val(Minute(Now()) * 60) + Second(Now());
	//Sets the delay equal to the startTime plus the amount of seconds passed to the function
	var Delay = StartTimeInSeconds + TimeDelay;
	//Makes the EndTime and CurrTimeInSeconds variable private to this function
	var EndTime = "";
	var CurrTimeInSeconds = "";
	var debugmode = false;
	
	if(arrayLen(arguments) gte 2) debugmode = arguments[2];

	//Start Loop
	do { 
		//Calculates the current seconds
		CurrTimeInSeconds = Val(Hour(Now()) * 720) + Val(Minute(Now()) * 60) + Second(Now()); 
		}
	while(CurrTimeInSeconds neq Delay);
	//Sets the EndTime when the do-while loop has completed
	EndTime = TimeFormat(CreateTime(Hour(Now()),Minute(Now()),Second(Now())), "HH:mm:ss");
	
	//Writes output if DebugMode is true
	if(debugMode) {
		WriteOutput('Start: #StartTime#<br />Paused for #TimeDelay# seconds<br />End: #EndTime#<br />');
	}
	 
}
</cfscript>