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
 * Gets the last date in a given quarter.
 * 
 * @param quarter 	 A number from 1 to 4. (Required)
 * @return Returna a date. 
 * @author Brian Sweeney (brianvsweeney@hotmail.com) 
 * @version 1, February 14, 2004 
 */
function GetLastDateinQuarter(quarter){
	switch(quarter){
		case 1:
			return CreateDate(year(now()), 3, DaysInMonth(CreateDate(year(now()),3,1)));
			break;
		case 2:
			return CreateDate(year(now()), 6, DaysInMonth(CreateDate(year(now()),6,1)));
			break;
		case 3:
			return CreateDate(year(now()), 9, DaysInMonth(CreateDate(year(now()),9,1)));
			break;
		case 4:
			return CreateDate(year(now()), 12, DaysInMonth(CreateDate(year(now()),12,1)));
			break;
	}
}
</cfscript>