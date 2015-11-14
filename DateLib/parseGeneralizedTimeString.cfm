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
 * Creates a date/time object from a generalized time string in the format of YYYYMMDDHHMMSS.0Z
 * 
 * @param timeString 	 Generalized time string. (Required)
 * @return Returns a date object. 
 * @author Michael Dawson (md40@evansville.edu) 
 * @version 1, December 16, 2005 
 */
function parseGeneralizedTimeString(timeString){
	// This function expects a generalize time string in the following format: 19880923191500.0Z

	// Return the parsed date/time object.
	return parseDateTime(left(arguments.timeString, 4) & "-" & mid(arguments.timeString, 5, 2) & "-" & mid(arguments.timeString, 7, 2) & " " & mid(arguments.timeString, 9, 2) & ":" & mid(arguments.timeString, 11, 2) & ":" & mid(arguments.timeString, 13, 2));
}
</cfscript>