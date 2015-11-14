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
 * Returns a date for Election Day in a given year
 * This function requires the GetNthOccOfDayInMonth() function available from the DateLib library. Minor modifications by Rob Brooks-Bilson
 * 
 * @param TheYear 	 The year you want to return Election Day for. 
 * @return Returns a date object. 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 1, August 28, 2001 
 */
//Election Day: Tuesday after First Monday in November, in even numbered years.
// for odd numbered years, -1 is returned
function GetElectionDay() {
 Var TheYear=Year(Now());
 if(ArrayLen(Arguments)) 
   TheYear = Arguments[1];
 if(TheYear MOD 2 eq 0){ 
   return DateAdd("d",1,CreateDate(TheYear,11,GetNthOccOfDayInMonth(1,2,11,TheYear))); //add 1 day to first monday
	} 
  else {
    return -1;
  }
}
</cfscript>