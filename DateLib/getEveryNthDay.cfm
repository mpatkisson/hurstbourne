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
 * determine every nth day of week for a given year.
 * 
 * @param dow 	 The numeric day of the week. (Required)
 * @param nth 	 Week number in the month. (Required)
 * @param yy 	 Year to iterate over. (Required)
 * @return Returns an array. 
 * @author charlie griefer (charlie@griefer.com) 
 * @version 1, March 30, 2006 
 */
function getEveryNthDay(dow,nth,yy) {
	var containerArray = arrayNew(1);
	
	var mm 			= "";
	var dd 			= "";
	var startDate	= "";
	var dateFound	= 0;
	
	if (val(dow) LT 1 OR val(dow) GT 7) return false;
	
	for (mm=1; mm LTE 12; mm=mm+1) {
		dateFound = 0;
		for (dd=1; dd LTE daysInMonth(createDate(yy, mm, 1)); dd=dd+1) {
			startDate = createDate(yy, mm, dd);
			if (dayOfWeek(startDate) EQ dow) {
				dateFound = dateFound + 1;
				if (dateFound EQ nth) arrayAppend(containerArray, startDate);
			}
		}
	}
	
	return containerArray;
}
</cfscript>