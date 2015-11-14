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
 * Get total time from seconds in hh:mm:ss format
 * 
 * @param seconds 	 Number of seconds (Required)
 * @return Returns a time object. 
 * @author Hamlet Javier (hamlet@igetspanish.com) 
 * @version 0, May 9, 2009 
 */
function totalTimeFromSec(seconds)
{
	Var xHr = (seconds\3600); // find hour 
	Var xMin = (seconds\60) - (xHr*60); // Find minutes
	Var xSec = seconds - (xHr * 3600) - (xMin*60); // find seconds
	var xTime = "#NumberFormat(xHr,'00')#:#NumberFormat(xMin,'00')#:#NumberFormat(xSec,'00')#"; //return in time format
	return xTime;
}
</cfscript>