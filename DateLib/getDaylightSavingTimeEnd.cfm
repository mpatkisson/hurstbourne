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
 * Returns the date for the End of Daylight Saving Time for a given year.
 * This function requires the GetLastOccOfDayInMonth() function available from the DateLib library.
 * 
 * @param TheYear 	 Year you want to return the end of Daylight Saving Time. (Optional)
 * @return Returns a date object. 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 1, December 20, 2006 
 */
function getDaylightSavingTimeEnd() {
	var TheYear=Year(Now());
  	if(ArrayLen(Arguments)) TheYear = Arguments[1];
	//US Congress changed it for 2007,may switch back
	// From last Sunday in October to First Sunday in November 
	if(TheYear lt 2007) return CreateDate(TheYear,10,GetLastOccOfDayInMonth(1,10,TheYear));
	else return CreateDate(TheYear,11,GetNthOccOfDayInMonth(1,1,11,TheYear));
	return CreateDate;
}
</cfscript>