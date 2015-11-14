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
 * Returns an array of dates with the week ending date of each week in the month.
 * 
 * @param theMonth 	 Month to use. (Required)
 * @param theYear 	 Year to use. (Required)
 * @return Returns an array. 
 * @author Brian Rinaldi (brinaldi@criticaldigital.com) 
 * @version 1, January 13, 2004 
 */
function getWeekEnding(theMonth,theYear) {
	/**
	 * week ending day is a friday for our purposes as the end of the business week
	 * this can be modified to return a week ending on whatever day you want
	*/
	var endOfWeek = 6;
	var theDay = 0;
	var i = 1;
	var arrDate = arrayNew(1);
	
	var theDate = "";
	
	// loop to find the first friday of the month
	do {
		theDay = theDay + 1;
	} while (dayOfWeek(createDate(theYear,theMonth,theDay)) NEQ endOfWeek);
	// establish the first friday of the month
	theDate = createDate(theYear,theMonth,theDay);
	// set the first week end date in the array
	arrDate[i] = theDate;
	/**
	 * loop through the rest of the month adding seven to the date until the date
	 * exceeds the end of the month
	*/
	i=i+1;
	while (month(dateAdd('d',7,theDate)) EQ theMonth) {
		theDate = dateAdd('d',7,theDate);
		arrDate[i] = theDate;
		i = i + 1;
	}
	return arrDate;
}
</cfscript>