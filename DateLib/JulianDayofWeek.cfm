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
 * Returns the day of the week for a date in the Julian calendar.
 * The original alogrithim for the calculation was found at: http://www.faqs.org/faqs/calendars/faq/part1/
 * 
 * @param fullDate 	 Date you want to return the Julian day of the week for. 
 * @return Returns an integer between 1 and 7 representing the day of the week (1=Sunday). 
 * @author Beau A.C. Harbin (bharbin@figleaf.com) 
 * @version 1.0, September 5, 2001 
 */
function JulianDayofWeek(){
        var date=iif(arraylen(arguments) gt 0,"arguments[1]", "Now()");
	var month = DatePart("m", date);
	var day = DatePart("d", date);
	var year = DatePart("yyyy", date);
	var a = 0;
	var y = 0;
	var m = 0;
	var dayOfWeek = 0;
	a = (14 - month) \ 12;
	y = year - a;
	m = month + 12*a - 2;
	// for Julian calendar:
	dayOfWeek = ((5 + day + y + y\4 + (31*m)\12) mod 7)+1;

	// for Gregorian calendar:
	if(arraylen(arguments) EQ 0){
		dayOfWeek = DayofWeek(date);
	}

	return dayOfWeek;
}
</cfscript>