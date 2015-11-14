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
 * Returns the localized version of a day of the week.
 * Original idea + code from Ben Forta
 * 
 * @param day_of_week 	 The day of the week. 
 * @param locale 	 Locale to use. Defaults to current locale. 
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, July 17, 2001 
 */
function LSDayOfWeekAsString(day_of_week) {
	//create arbitrary date
	VAR d=CreateDate(2000, 6, 1);
	VAR dow = DayOfWeek(d);
	VAR oldlocale = "";
	VAR tempstr = "";

	if(dow neq day_of_week) d = dateAdd("d",day_of_week-dow,d);

	if(ArrayLen(Arguments) eq 2) {
		oldLocale = setLocale(arguments[2]);
		tempstr = LSDateFormat(d,"dddd");
		setLocale(oldLocale);
	} else {
		tempstr = LSDateFormat(d,"dddd");
	}
	return tempstr;
}
</cfscript>