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
 * Returns the date for The start of Daylight Saving Time for a given year.
 * This function requires the GetNthOccOfDayInMonth() function available from the DateLib library.
 * 
 * @param TheYear 	 Year you want to return the start of Daylight Saving Time. (Optional)
 * @return Returns a date object. 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 2, December 20, 2006 
 */
function getDaylightSavingTimeStart() {
	var TheYear=Year(Now());
  	if(ArrayLen(arguments)) TheYear = arguments[1];
	//US Congress changed it for 2007,may switch back
	// From first Sunday in April to Second Sunday in March 
	if(TheYear lt 2007) return CreateDate(TheYear,4,GetNthOccOfDayInMonth(1,1,4,TheYear));
	else return CreateDate(TheYear,3,GetNthOccOfDayInMonth(2,1,3,TheYear));
}
</cfscript>