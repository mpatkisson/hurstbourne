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
 * Returns the ordinal for the day of the week for the specified date/time object according to ISO standards.
 * 
 * @param date 	 Date time object 
 * @return Returns an integer between 1 and 7. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, August 17, 2001 
 */
function ISODayOfWeek(date)
{
  if (DayOfWeek(date) EQ 1) 
    Return 7;
  else 
    Return DayOfWeek(date)-1;
}
</cfscript>