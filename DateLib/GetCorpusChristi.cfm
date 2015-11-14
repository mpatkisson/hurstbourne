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
 * Returns the date for Corpus Christi in a given year.
 * This function requires the GetEaster() function available from the DateLib library.
 * 
 * @param TheYear 	 Year you want to get Corpus Christi for. 
 * @return Returns a date object. 
 * @author Beau A.C. Harbin (bharbin@figleaf.com) 
 * @version 1.0, October 5, 2001 
 */
function GetCorpusChristi() {
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  Return DateAdd("d", 60, GetEaster(TheYear));
}
</cfscript>