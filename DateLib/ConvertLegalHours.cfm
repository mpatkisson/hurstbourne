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
 * Function that returns legal billing time from standard time format.
 * 
 * @param hourString 	 A string containing the number of hours, minutes, and seconds in the format: H:MM:SS. (Required)
 * @return Returns a string. 
 * @author Joe (jcraven@akingump.com) 
 * @version 1, July 3, 2002 
 */
function ConvertHours(HourString) {
	var HourWords = "";
	var MinuteVal = Round(val(listGetAt(HourString,2,":"))/6);
	var HourVal = listFirst(hourString,":");
	
	if(len(HourVal) is 1) {
		if(HourVal is "0") HourWords = '0.';
		else HourWords = HourVal & '.';
	} else HourWords = HourVal & '.';
	
	HourWords = HourWords & MinuteVal;
	return HourWords;
}
</cfscript>