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
 * Check if two dates refer to the same day.
 * 
 * @param date1 	 First date to check. 
 * @param date2 	 Second date to check. 
 * @return Returns a boolean. 
 * @author Matthew Walker (matthew@cabbagetree.co.nz) 
 * @version 1, March 21, 2002 
 */
function DifferentDay(date1, date2) {
	return ( ( DayOfYear(date1) NEQ DayOfYear(date2) ) OR ( Year(date1) NEQ Year(date2) ) );
}
</cfscript>