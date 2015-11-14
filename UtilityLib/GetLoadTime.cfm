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
 * Measures the elapsed time (load time) from when the single function was first called to the time it was last called.
 * 
 * @param mes 	 Type of measurement, either 'mil' for miliseconds or 'sec' for seconds. (Required)
 * @param beg 	 Beginning tick count. (Required)
 * @return Returns a string. 
 * @author Kyle W. McNamara (mac@kwm.tm) 
 * @version 1, October 10, 2002 
 */
function GetLoadTime(mes,beg) {
	var measurement = 0;
	var measure_text = "";
	var tickBeginValue = 0;
	var tickEnd = 0;
	var loadTime = "";

	if (mes eq "mil") {
		measurement = 1;
		measure_text = " Milliseconds";
	}
	else if (mes eq "sec") {
		measurement = 1000;
		measure_text = " Seconds";
	}
	tickBeginValue = beg;
	tickEnd = gettickcount();
	loadTime = ((tickEnd - tickBeginValue)/measurement) & measure_text;
	return loadTime;
}
</cfscript>