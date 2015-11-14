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
 * Formats a number of minutes into &quot;XX hours XX minutes&quot;.
 * v2 Charlie Arehart found a bug if hours exactly 2, it said hour, not hours
 * 
 * @param minutes 	 Number of minutes to convert to hours/minutes. (Required)
 * @return Returns a string. 
 * @author Andrew Muller (rebel@daemon.com.au) 
 * @version 2, July 2, 2008 
 */
function hoursMinutes(minutes) {
	var tempstr = "";
	var strHours = minutes / 60;
	var strMinutes = minutes MOD 60;
	var hourText = "";
	if (strHours gte 1) {
		if (strHours gte 2) {
			hourText = " hours ";
		} else {
			hourText = " hour ";
		}
		tempstr = Fix(strHours) & hourText;
	}
	
	if (strMinutes gt 0) {
		tempstr = tempstr & strMinutes & " minutes";
	}
	return tempstr;
}
</cfscript>