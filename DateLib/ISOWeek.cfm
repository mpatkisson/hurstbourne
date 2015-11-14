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
 * Returns the weeknumber according to the ISO standard.
 * 
 * @param inputDate 	 Date object. (Required)
 * @return Returns a number. 
 * @author Ron Pasch (pasch@cistron.nl) 
 * @version 1, January 12, 2004 
 */
function ISOWeek(inputDate) {  
    var d = StructNew();
	var d2 = 0;
	var days = 0;
	d.yday = DayOfYear(inputDate);
	d.wday = DayOfWeek(inputDate)-1;
	d.year = Year(inputDate);
    days = d.yday - ((d.yday - d.wday + 382) MOD 7) + 3;
    if(days LT 0) {
        d.yday = d.yday + 365 + isLeapYear(d.year-1);
        days = d.yday - ((d.yday - d.wday + 382) MOD 7) + 3;
    } else {
        d.yday = (d.yday - 365) + isLeapYear(d.year);
        d2 = d.yday - ((d.yday - d.wday + 382) MOD 7) + 3;
        if (0 LTE d2) {
            days = d2;
        }
    }
	return int((days / 7) + 1);
}
</cfscript>