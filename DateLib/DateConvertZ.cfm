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
 * Similar to DateConvert, but provides local2zone and zone2local conversion from one time zone to another.
 * 
 * @param conversionType 	 Conversion type to use.  Options are zone2local (date object is from the specified time zone and this will convert it to local time) and local2zone (date object is based on local server time and this will convert it to the specfied time zone.):   
 * @param dateObj 	 Date object you want to convert. 
 * @param zoneInfo 	 Standard time zone abbreviation as well as standard plus mod such as PST-8. 
 * @return Returns a date/time object. 
 * @author Chris Wigginton (cwigginton@macromedia.com) 
 * @version 1, November 26, 2001 
 */
function DateConvertZ(conversionType, dateObj, zoneInfo)
{
  var targetZone = "";
  var targetSpan = 0;
  var targetDate = "";
  var utcDate = "";
  var hourDiff = 0;
  var minDiff = 0;
  var zoneModOffSet = 0;
  var zoneMod = 0;
	
  //timeZone object
  var timeZone = StructNew();
  timeZone.UTC  =   0;     // Universal Time Coordinate or universal time zone
  timeZone.GMT  =   0;     // Greenwich Mean Time same as UTC
  timeZone.BST  =   1;     // British Summer time
  timeZone.IST  =   1;     // Irish Summer Time
  timeZone.WET  =   1;     // Western Europe Time
  timeZone.WEST =   1;     // Western Europe Summer Time
  timeZone.CET  =   1;     // Central Europe Time
  timeZone.CEST =   2;     // Central Europe Summer Time
  timeZone.EET  =   2;     // Eastern Europe Time
  timeZone.EEST =   3;     // Eastern Europe Summer Time
  timeZone.MSK  =   3;     // Moscow time
  timeZone.MSD  =   4;     // Moscow Summer Time
  timeZone.AST  =  -4;     // Atlantic Standard Time
  timeZone.ADT  =  -3;     // Atlantic Daylight Time
  timeZone.EST  =  -5;     // Eastern Standard Time
  timeZone.EDT  =  -4;     // Eastern Daylight Saving Time
  timeZone.CST  =  -6;     // Eastern Time
  timeZone.CDT  =  -5;     // Central Standard Time
  timeZone.MST  =  -7;     // Mountain Standard Time
  timeZone.MDT  =  -6;     // Mountain Daylight Saving Time
  timeZone.PST  =  -8;     // Pacific Standard Time
  timeZone.HST  = -10;     // Hawaiian Standard Time
  timeZone.AKST =  -9;     // Alaska Standard Time
  timeZone.AKDT =  -8;     // Alaska Standard Daylight Saving Time
  timeZone.AEST =  10;     // Australian Eastern Standard Time
  timeZone.AEDT =  11;     // Australian Eastern Daylight Time
  timeZone.ACST = 9.5;     // Australian Central Standard Time
  timeZone.ACDT = 10.5;    // Australian Central Daylight Time
  timeZone.AWST =   8;     // Australian Western Standard Time
    
  //Check for +- timezone mod such as PST-4
  zoneModOffSet = FindOneOf("+-", zoneInfo);
  if(zoneModOffSet) {
    //Extract out the zoneInfo and zoneMod
    zoneMod = Val(Right(zoneInfo, Len(zoneInfo) - zoneModOffSet + 1));
    zoneInfo = Left(zoneInfo, zonemodOffSet - 1);			
  }
	
  targetZone = timeZone[zoneInfo] + zoneMod;
	
  // Grab Target Zone Info
  hourDiff = fix(targetZone);
  minDiff = (targetZone - hourDiff) * 60; 
	
  targetSpan = CreateTimeSpan(0, hourDiff, minDiff, 0);

  if (conversionType IS "local2zone") {
    // date is local time so convert it to utc first
    utcDate = DateConvert("Local2Utc", dateObj) ;
    // Add the target zone difference
    targetDate = utcDate + targetSpan;
    return "{ts '" & DateFormat(targetDate, "yyyy-mm-dd ") & TimeFormat(targetDate, "HH:mm:ss") & "'}";
  }
  else if (conversionType is "zone2local") {
    //date is in the target zone so convert it to utc first
    targetDate = dateObj - targetSpan;
    //convert it back from utc to local
    targetDate = DateConvert("Utc2local", targetDate);	
    return "{ts '" & DateFormat(targetDate, "yyyy-mm-dd ") & TimeFormat(targetDate, "HH:mm:ss") & "'}";
  }
  return "{ts 'yyyy-mm-dd HH:mm:ss'}"; // error return
}
</cfscript>