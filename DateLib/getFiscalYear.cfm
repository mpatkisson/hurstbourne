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
 * Returns fiscal year for a date
 * 
 * @param date 	 valid date to determine fiscal year for (Optional)
 * @return Returns a number 
 * @author Bob Clingan (bob@bobclingan.com) 
 * @version 0, March 6, 2010 
 */
function GetFiscalYear() {
		var datetime = now();
		var month = month(datetime);
		if (ArrayLen(Arguments) gte 1) {
		if (IsDate(Arguments[1])) {
			datetime = Arguments[1];
			month = month(datetime);
		} else datetime = Now();
		}
		if(month gte 10)
	    	return Year(DateAdd('yyyy', 1, datetime));
		else
		   return Year(datetime);
	}
</cfscript>