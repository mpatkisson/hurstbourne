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
 * Returns a string for a day value.
 * 
 * @param daynum 	 Day number to convert. (Required)
 * @return Returns a string. 
 * @author Larry Juncker (ljuncker@aljcompserv.com) 
 * @version 1, November 1, 2002 
 */
function dayAsString(daynum) {
    var dayList="First,Second,Third,Fourth,Fifth,Sixth,Seventh,Eighth,Ninth,Tenth,Eleventh,Twelveth,Thirteenth,Fourteenth,Fifteenth,Sixteenth,Seventeenth,Eighteenth,Nineteenth,Twentieth,Twenty First,Twenty Second,Twenty Third,Twenty Fourth,Twenty Fifth,Twenty Sixth,Twenty Seventh,Twenty Eighth,Twenty Ninth,Thirtieth,Thirty First";
    return ListGetAt(dayList,daynum);
}
</cfscript>