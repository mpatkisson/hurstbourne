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
 * Returns season for given date.
 * 
 * @param myDate 	 The date. Defaults to now. (Optional)
 * @return Returns a string. 
 * @author William Steiner (williams@hkusa.com) 
 * @version 1, May 13, 2003 
 */
function GetSeason() {
	var myDate = iif(arraylen(arguments) gt 0,"arguments[1]", "now()");
	var myYear = Year(myDate);
	//Winter
	var winterStart = '12-21-' & decrementValue(myYear);
	var winterEnd = '03-20-' & myYear;
	//Spring
	var springStart = '3-21-' & myYear;
	var springEnd = '06-20-' & myYear;
	//Summenr 
	var summerStart = '06-21-' & myYear;
	var summerEnd ='09-20-' & myYear;
	//Fall
	var fallStart = '09-21-' & myYear;
	var fallEnd = '12-20-' & myYear;
	
	// return the correct season
	if (myDate GTE winterStart AND myDate LTE winterEnd) {
		return "Winter";
	} else if (myDate GTE springStart AND myDate LTE springEnd) {
		return "Spring";
	} else if (myDate GTE summerStart AND myDate LTE summerEnd) {
		return "Summer";
	} else if (myDate GTE fallStart AND myDate LTE fallEnd) {
		return "Fall";
	} else {
		return "";
	}
}
</cfscript>