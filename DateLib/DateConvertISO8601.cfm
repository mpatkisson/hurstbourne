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
 * Convert a date in ISO 8601 format to an ODBC datetime.
 * 
 * @param ISO8601dateString 	 The ISO8601 date string. (Required)
 * @param targetZoneOffset 	 The timezone offset. (Required)
 * @return Returns a datetime. 
 * @author David Satz (david_satz@hyperion.com) 
 * @version 1, September 28, 2004 
 */
function DateConvertISO8601(ISO8601dateString, targetZoneOffset) {
	var rawDatetime = left(ISO8601dateString,10) & " " & mid(ISO8601dateString,12,8);
	
	// adjust offset based on offset given in date string
	if (uCase(mid(ISO8601dateString,20,1)) neq "Z")
		targetZoneOffset = targetZoneOffset -  val(mid(ISO8601dateString,20,3)) ;
	
	return DateAdd("h", targetZoneOffset, CreateODBCDateTime(rawDatetime));

}
</cfscript>