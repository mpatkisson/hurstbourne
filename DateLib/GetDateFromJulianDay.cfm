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
 * Calculates the date and time from a provided Julian Day value.
 * 
 * @param JulianDay 	 Value representing the Julian day you want to retrieve the date/time for. 
 * @return Returns a date/time object. 
 * @author Beau A.C. Harbin (bharbin@figleaf.com) 
 * @version 1.0, September 5, 2001 
 */
function GetDateFromJulianDay(JulianDay){
	var a = 0;
	var b = 0;
	var c = 0;
	var d = 0;
	var e = 0;
	var m = 0;
	var date = 0;
	var JD = JulianDay;
	var time = 0;
	
	a = JD + 32044;
	b = ((4 * a) + 3) \ 146097;
	c = a - (b * 146097) \ 4;
	d = (4 * c + 3) \ 1461;
	e = c - ((1461 * d) \ 4);
	m = (5 * e + 2) \ 153;

	time = TimeFormat(JulianDay, "HH:MM:SS");
	date = DateAdd("h", 12, CreateDateTime(((b * 100) + d - 4800 + (m \ 10)), (m + 3 - (12 * (m \ 10))), ((e - (153 * m + 2) \ 5) + 1), DatePart("h", time), DatePart("n", time), DatePart("s", time)));
	
	return date;
}
</cfscript>