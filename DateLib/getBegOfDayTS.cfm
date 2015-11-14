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
 * A function which returns a Beginning Of Day TimeStamp. For example, 1/1/2000 10:30 PM returns {ts '2000-01-01 00:00:00'}.
 * 
 * @param date 	 Date to use. (Required)
 * @return Returns a timestamp. 
 * @author Sami Hoda (samihoda@gmail.com) 
 * @version 1, January 30, 2006 
 */
function getBegOfDayTS(date) {
	var vDate = date;	
	vDate = dateFormat(vDate, 'MM/DD/YYYY');
	vDate = DateAdd("h",00,vDate);
	vDate = DateAdd("n",00,vDate);
	vDate = DateAdd("s",00,vDate);
	
	return vDate;
}
</cfscript>