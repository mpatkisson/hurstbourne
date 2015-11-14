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
 * Takes a ColdFusion date object and returns a DB2 formatted timestamp.
 * 
 * @param dateObj 	 A data object. (Required)
 * @param emulateTick 	 A boolean. (Required)
 * @return Returns a string. 
 * @author Chris Wigginton (cwigginton@macromedia.com) 
 * @version 1, June 27, 2002 
 */
function getDB2TimeStamp(dateObj, emulateTick)
{
	var tick = "000000";
	// We can partially emulate milliseconds by 
	//grabbing the current tick and applying it to the date object
	if(emulateTick IS "Yes")
		tick = Right(GetTickCount(),3) & "000";
		
	return DateFormat(dateObj, "yyyy-mm-dd-") & TimeFormat(dateObj, "HH.mm.ss.") & tick; 
}
</cfscript>