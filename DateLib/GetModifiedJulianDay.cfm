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
 * Calculates the modified Julian Day for any date in the Gregorian calendar.
 * This function requires the GetJulianDay() function available from the DateLib library.  Minor edits by Rob Brooks-Bilson (rbils@amkor.com).
 * 
 * @param TheDate 	 Date you want to return the modified Julian day for. 
 * @return Returns a numeric value. 
 * @author Beau A.C. Harbin (bharbin@figleaf.com) 
 * @version 1.0, September 4, 2001 
 */
function GetModifiedJulianDay()
{
  var date = Now();
  var ModifiedJulianDay = 0;
  if(ArrayLen(Arguments)) 
    date = Arguments[1];	
  ModDate = GetJulianDay(date);
  ModifiedJulianDay = ModDate - 2400000.5;
  return ModifiedJulianDay;
}
</cfscript>