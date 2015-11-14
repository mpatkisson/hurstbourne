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
 * I return the &quot;am/pm&quot; portion of a date/time (aka the &quot;meridiem&quot;).
 * * version 0.1 by Nolan Erck
 * * version 0.2 by Nolan Erck: fixing small bug
 * * version 1.0 by Adam Cameron: factoring-out redundant date-checking logic
 * 
 * @param dateTime 	 A datetime as a date or a string that will parse as a datetime (Required)
 * @return Returns a string that is either AM or PM 
 * @author Nolan Erck (nolan@southofshasta.com) 
 * @version 1.1, November 14, 2012 
 */
string function getMeridiem(required date dateTime){
	return timeFormat(dateTime, "tt");
}
</cfscript>