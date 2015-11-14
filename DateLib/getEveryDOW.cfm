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
 * Returns every occasion of a day of the week. A list of days of the week can be used.
 * Updates by Scott Pinkston and Peter Boughton to support a 'range' instead of just a year.
 * Fix by Jim O'Keefe to prevent values outside of this year.
 * 
 * @param dowList 	 A list of days of the week in numeric form. (Required)
 * @param startdate 	 Initial range for search. Defaults to the beginning of the current year. (Optional)
 * @param enddate 	 Initial range for search. Defaults to the end of the current year. (Optional)
 * @return Returns an array. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, July 27, 2011 
 */
function getEveryDOW(dowlist) {
	var day1 = "";
	var x = "";
	var thisDOW = "";
	var result = arrayNew(1);
	var initialDOW = "";
	var offset = "";
	var dateToAdd = "";
	var startdate = createDate(year(now()), 1, 1);
	var enddate = createDate(year(now()), 12, 31);
	
	day1 = startdate;
	initialDOW = dayOfWeek(day1);

	if(arrayLen(arguments) gte 2) {
		startdate = arguments[2];
	}
	if(arrayLen(arguments) gte 3) {
		enddate = arguments[3];
	}

	while( day1 LT enddate ) {
		for(x=1; x lte listlen(dowlist); x=x+1) {
			thisDOW = listGetAt(dowlist, x);
			offset = thisDOW - initialDOW;
			dayToAdd = dateAdd("d", offset, day1 );
			if (dayToAdd gte startDate and dayToAdd lte endDate) {arrayAppend(result, dayToAdd);}
		}
		day1 = dateAdd("ww", 1, day1);
	}
	return result;
}
</cfscript>