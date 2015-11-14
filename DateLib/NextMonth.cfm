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
 * Returns a date object representing the first day of the next month.
 * Version 2 by Raymond Camden
 * 
 * @param Date 	 Date object to go to the next month on. Defaults to now. 
 * @return Returns a date object. 
 * @author Will Belden (wbelden@dwo.net) 
 * @version 1, September 6, 2001 
 */
function NextMonth() {
 	var db = iif(arrayLen(arguments),"arguments[1]","now()");
	return DateAdd("m",1,CreateDate(Year(db), Month(db), 1));
}
</cfscript>