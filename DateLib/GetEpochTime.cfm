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
 * Returns the number of seconds since January 1, 1970, 00:00:00
 * 
 * @param DateTime 	 Date/time object you want converted to Epoch time. 
 * @return Returns a numeric value. 
 * @author Chris Mellon (mellan@mnr.org) 
 * @version 1, February 21, 2002 
 */
function GetEpochTime() {
	var datetime = 0;
	if (ArrayLen(Arguments) is 0) {
		datetime = Now();

	}
	else {
		if (IsDate(Arguments[1])) {
			datetime = Arguments[1];
		} else {
			return NULL;
		}
	}
	return DateDiff("s", "January 1 1970 00:00", datetime);
		
		
}
</cfscript>