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
 * Makes a &quot;European&quot; date (day before month) into a U.S. style date.
 * 
 * @param euroDate 	 Date string. (Required)
 * @return Returns a date string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, May 13, 2003 
 */
function parseEuroDate(euroDate){
	//grab the old locale, so we can switch it back
	var oldLocale = getLocale();
	//a var to hold our dateTime
	var dateTime = "";
	//set the locale to British -- they use the Euro format!
	setLocale("English (UK)");
	//parse it using the localization function for parsing date time
	dateTime = LSParseDateTime(arguments.euroDate);
	//now set the Locale back, so we don't mess up the server
	setLocale(oldLocale);
	//return our dateTime that was parsed
	return dateTime;
}
</cfscript>