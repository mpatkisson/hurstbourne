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
 * Returns True if the date provided in the first argument lies between the two dates in the second and third arguments.
 * 
 * @param dateObj  	 CF Date Object you want to test. 
 * @param dateObj1 	 CF Date Object for the starting date. 
 * @param dateObj2 	 CF Date Object for the ending date. 
 * @return Returns a Boolean. 
 * @author Bill King (bking@hostworks.com) 
 * @version 1, November 29, 2001 
 */
function IsDateBetween(dateObj, dateCompared1, dateCompared2)
{
 return YesNoFormat((DateCompare(dateObj, dateCompared1) gt -1) AND (DateCompare(dateObj, dateCompared2) lt 1));
}
</cfscript>