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
 * Returns larger of 2 dates.
 * 
 * @param dt1 	 The first date. (Is always the hardest.) (Required)
 * @param dt2 	 The second date. (Required)
 * @return Returns a date. 
 * @author Shawn Fairweather (psalm_119_@hotmail.com) 
 * @version 1, September 12, 2003 
 */
function maxDate(Dt1, Dt2){
     if(DateCompare(Dt1, Dt2) IS 1) return Dt1;
     else return Dt2;
}
</cfscript>