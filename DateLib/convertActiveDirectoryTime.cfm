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
 * Converts Active Directory 100-Nanosecond time stamps.
 * 
 * @param adTime 	 Time in ActiveDirectory format. (Required)
 * @return Returns a struct. 
 * @author Tariq Ahmed (tariq@dopejam.com) 
 * @version 1, September 6, 2006 
 */
function convertActiveDirectoryTime(adTime) {
	var retVal = structNew();
	var tempTime = arguments.adTime / (60*10000000);
	retVal.ts = DateAdd('n',tempTime,'1/1/1601');
	retVal.ts = DateConvert("utc2Local", retVal.ts );
	retVal.date = Dateformat(retVal.ts,'mm/dd/yyyy');
	retVal.time = Timeformat(retVal.ts,'HH:mm');
	return retVal;
}
</cfscript>