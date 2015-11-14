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
 * Returns the week numbers in a given month of a given year.
 * v2 mods by RCamden to fix December issues
 * 
 * @param month 	 Month number. (Required)
 * @param year 	 Year number. (Required)
 * @return Returns an array. 
 * @author Robby L. (robby@ohsogooey.com) 
 * @version 2, July 23, 2011 
 */
function weekNumsInMonth(month,year) {
	var fakedate = createDate(year,month,1);
	var firstWeek = week(fakedate);
	var lastweek = week(createDate(year,month,daysInMonth(fakedate)));
	var i="";
	var aWeek = arrayNew(1);
	for(i=firstWeek;i lte lastWeek;i=i+1) {
		arrayAppend(aWeek, i);
	}
	return aWeek;
 }
</cfscript>