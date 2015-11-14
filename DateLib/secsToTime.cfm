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
 * Takes number of seconds as input and returns a formatted string representation of that duration (weeks/days/hours/mins/secs).
 * 
 * @param seconds 	 The number of seconds. (Required)
 * @param format 	 Either l, m, s, for long, medium, or short. (Required)
 * @return Returns a string. 
 * @author Kevin Miller (kmiller@websolete.com) 
 * @version 1, October 19, 2004 
 */
function secsToTime(seconds,format) {
	var output = "";
	var timeval_w = "";
	var remaining_time = "";
	var t_w = "";
	var timeval_d = "";
	var t_d = "";
	var timeval_h = "";
	var t_h = "";
	var timeval_m = "";
	var t_m = "";
	var timeval_s = "";
	var t_s = "";
	var f_w = "";
	var f_d = "";
	var f_h = "";
	var f_m = "";
	var f_s = "";
		
	// handle very small times 
	if(arguments.seconds lt 1) {
		return "<1 sec";
	}

	// handle format syntax
	arguments.format = left(arguments.format,1);

	
	// weeks
	timeval_w = arguments.seconds/604800;
		if(timeval_w gte 1) {
				timeval_w = int(timeval_w); t_w = "#timeval_w#";
				remaining_time = arguments.seconds - (timeval_w * 604800); }
		else {
				remaining_time = arguments.seconds;
				t_w = ""; }
	// days
	timeval_d = remaining_time/86400;
		if(timeval_d gte 1) {
				timeval_d = int(timeval_d); t_d = "#timeval_d#";
				remaining_time = remaining_time - (timeval_d * 86400); }
		else {
				t_d = ""; }
	// hours
	timeval_h = remaining_time/3600;
		if(timeval_h gte 1) {
				timeval_h = int(timeval_h); t_h = "#timeval_h#";
				remaining_time = remaining_time - (timeval_h * 3600); }
		else {
				t_h = ""; }
	// minutes
		timeval_m = remaining_time/60;
			if(timeval_m gte 1) {
				timeval_m = int(timeval_m); t_m = "#timeval_m#";
				remaining_time = remaining_time - (timeval_m * 60); }
			else {
				t_m = ""; }
	// seconds
		timeval_s = remaining_time; 
			if(timeval_s gt 0) {
				t_s = "#round(timeval_s)#"; }
			else {
				t_s = ""; }

	switch (arguments.format) { 
		case "l": 
			f_w = "week"; f_d = "day"; f_h = "hour"; f_m = "minute"; f_s = "second";
			break;
		case "m":
			f_w = "wk"; f_d = "dy"; f_h = "hr"; f_m = "min"; f_s = "sec";
			break;
		case "s":
			f_w = "w"; f_d = "d"; f_h = "h"; f_m = "m"; f_s = "s";
			break;
		default: 
			f_w = "week"; f_d = "day"; f_h = "hour"; f_m = "minute"; f_s = "second";
			break;	
	}
	
	if(val(t_w)) {
		output = output & " #t_w# #f_w#";
		if((val(t_w) neq 1) and not listfindnocase("short,s",arguments.format)) output = output & "s"; 
	}
	if(val(t_d)) {
		output = output & " #t_d# #f_d#";
		if((val(t_d) neq 1) and not listfindnocase("short,s",arguments.format)) output = output & "s";
	}
	if(val(t_h)) {
		output = output & " #t_h# #f_h#";
		if((val(t_h) neq 1) and not listfindnocase("short,s",arguments.format)) output = output & "s"; 
	}
	if(val(t_m)) {
		output = output & " #t_m# #f_m#";
		if((val(t_m) neq 1) and not listfindnocase("short,s",arguments.format)) output = output & "s"; 
	}
	if(val(t_s)) {
		output = output & " #t_s# #f_s#";
		if((val(t_s) neq 1) and not listfindnocase("short,s",arguments.format)) output = output & "s";  
	}

	return output;

}
</cfscript>