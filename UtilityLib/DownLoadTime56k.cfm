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
 * Returns estimated download time for a 56k modem given the file size.
 * 
 * @param fileSize 	 File size in bytes. (Required)
 * @return Returns a string. 
 * @author William Steiner (williams@hkusa.com) 
 * @version 1, November 1, 2002 
 */
function DownLoadTime56k(fileSize) {
	var totalSeconds = (fileSize * 10) / 57600;
	var tempstring = "";
	var tempstring2 = "";
	var hours = totalSeconds / 3600;
	var minutes = totalSeconds / 60;
	var seconds = totalSeconds MOD 60;
	var hourText = "";
	var minuteText = "";

	// if over 60 minutes...get just minutes left from hours
	if (minutes gte 60) minutes = minutes MOD 60;
	
	if (hours gte 1) {
		if (hours gt 2) hourText = " hours ";
		else hourText = " hour ";
		tempstring = Fix(hours) & hourText;
	}

	if (minutes gte 1) {
		if (minutes gt 2) minuteText = " minutes ";
		else minuteText = " minute ";
		tempstring = tempstring & Fix(minutes) & minuteText;
	}
	
	if (seconds gt 0) tempstring = tempstring & seconds & " seconds";

	return tempstring ;
}
</cfscript>