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
 * This function takes a date time object and an offset, and outputs a GMT date/time formatted string.
 * 
 * @param aDate 	 A date. 
 * @param offset 	 A valid GMT offset. 
 * @return Returns a string. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, March 21, 2002 
 */
function GMTDateFormat (adate,offset) {
     // adate must be a valid date time object.
     // the offset must be in the format -0000 or +0000.
     
     var dvalue = ""; // the final value.
     
     if (IsDate(adate)) {
          
          dvalue = DateAdd('h',Left(offset,3),DateAdd('s',Left(offset,1) & Right(offset,2),adate));
          dvalue = Left( DayOfWeekAsString( DayOfWeek( dvalue ) ), 3) & 
                  ', ' & 
                  DateFormat(dvalue,'dd mmm yyyy') &
                  ' ' &
                  TimeFormat(dvalue,'HH:mm:ss') &
                  ' GMT';
          
          return dvalue;
     }
     
     else { return; }
}
</cfscript>