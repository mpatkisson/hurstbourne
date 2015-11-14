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
 * Calculates time from minutes after midnight.
 * 
 * @param Minutes 	 Number of minutes elapsed since midnight. 
 * @return Returns a date/time object. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, February 21, 2002 
 */
function GetTimeFromMinutes(minutes)
{
  Var tHr = (((minutes\60)-1) Mod 24)+1;
  Var tMin = minutes-(tHr*60);
  return CreateTime(tHr,tMin, 0);
}
</cfscript>