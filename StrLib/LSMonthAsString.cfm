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
 * Returns the localized version of a month.
 * Original code + idea from Ben Forta
 * 
 * @param month_number 	 The month number. 
 * @param locale 	 Locale to use. Defaults to current locale. 
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 1, July 17, 2001 
 */
function LSMonthAsString(month_number) {
	VAR d=CreateDate(2000, month_number, 1);
	VAR oldlocale = "";
	VAR tempstr = "";
	if(ArrayLen(Arguments) eq 2) {
		oldLocale = setLocale(arguments[2]);
		tempstr = LSDateFormat(d,"mmmm");
		setLocale(oldLocale);
	} else {
		tempstr = LSDateFormat(d,"mmmm");
	}
	return tempstr;
}
</cfscript>