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
 * Formats a time difference in hours, minutes and seconds.
 * 
 * @param time 	 An integer representing a time duration. (Required)
 * @param type 	 The type of the time duration. Defaults to milliseconds. (Optional)
 * @param mask 	 Mask for HSMFormat. Defaults to "HH:MM:SS" (Optional)
 * @param displayMS 	 Boolean to display milliseconds. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author Pascal Peters (ppeters@lrt.be) 
 * @version 1, May 14, 2002 
 */
function HMSFormat(time) {
	var str = "";
	var tmptime = 0;
	var h = 0;
	var m = 0;
	var s = 0;
	var sign = "";
	// default values for optional parameters
	var type = "ms";
	var mask = "HH:MM:SS";
	var displayMs = false;
	
	if(ArrayLen(Arguments) gte 2) type = Arguments[2];
	if(ArrayLen(Arguments) gte 3) mask = Arguments[3];
	if(ArrayLen(Arguments) gte 4) displayMs = Arguments[4];
	
	if(not IsNumeric(time)) return time;
	if(time lt 0){
		time = Abs(time);
		sign = "-";
	} 
	
	switch(type){
	case "h":
		h = int(time);
		tmptime = (time - h)*60;
		m = int(tmptime);
		s = (tmptime - m)*60;
		break;
	case "m":
		h = int(time/60);
		tmptime = time - h*60;
		m = int(tmptime);
		s = (tmptime - m)*60;
		break;
	case "s":
		h = int(time/3600);
		tmptime = time - h*3600;
		m = int(tmptime/60);
		s = tmptime - m*60;
		break;
	default:
		h = int(time/3600000);
		tmptime = time - h*3600000;
		m = int(tmptime/60000);
		tmptime = tmptime - m*60000;
		s = tmptime/1000;
		break;
	}
	
	m = NumberFormat(m,"00");
	if(displayMs) s = NumberFormat(s,"00.000");
	else s = NumberFormat(Round(s),"00");
	str = Replace(mask,"HH",sign & h,"ALL");
	str = Replace(str,"MM",m,"ALL");
	str = Replace(str,"SS",s,"ALL");

	return str;
}
</cfscript>