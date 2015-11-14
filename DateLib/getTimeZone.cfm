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
 * Returns the Time Zone Code (string) that corresponds to the dateTime passed in.
 * 
 * @param dateTimeIn 	 The date to parse. (Required)
 * @return Returns a string. 
 * @author Tony Felice (staff@nokama.com) 
 * @version 1, January 6, 2004 
 */
function getTimeZone(dateTimeIn) {
	var timeZoneInfo = GetTimeZoneInfo();
	var dateGMT = mid(replace(getHttpTimeString(),"GMT","","ALL"),6,len(replace(getHttpTimeString(),"GMT","","ALL")));
	var dateFactor = dateCompare(dateTimeIn, dateGMT);
	var dateDelta = round(DateDiff("n", dateTimeIn, dateGMT)/60);
	var trueZoneOffset = (dateDelta * dateFactor);
	var offsetList="";
	var zoneCodeList="";
	var listPos="";
	var timeZoneCode="";
	
	
	//standard time zones
	var stdZoneCodeList = "HST,AKST,PST,MST,CST,EST,AST,NST,GMT,CET,EET,MSK,AWST,ACST,AEST";
	var stdOffsetList = "-10,-9,-8,-7,-6,-5,-4,-3.5,0,1,2,3,8,9.5,10";
	
	// daylight saving time zones
	var dstZoneCodeList = "AKDT,PDT,MDT,CDT,EDT,ADT,NDT,GMT,WEST,CEST,EEST,MSD,ACDT,AEDT";
	var dstOffsetList = "-8,-7,-6,-5,-4,-3,-2.5,0,1,2,3,4,10.5,11";
	
	if(timeZoneInfo.isDSTOn IS "YES"){
		offsetList = dstOffsetList;
		zoneCodeList = dstZoneCodeList;
	} else {
		offsetList = stdOffsetList;
		zoneCodeList = stdZoneCodeList;
	}
	
	listPos = ListFindNoCase(OffsetList,trueZoneOffset);
	
	if(listPos NEQ 0) timeZoneCode = ListGetAt(ZoneCodeList,listPos); 
	else timeZoneCode = "UNK";
	
	return timeZoneCode;
}
</cfscript>