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
 * Returns true if passed value is formatted in &quot;baseEexp&quot; scientific notation.
 * Modified to allow D since versions prior to MX would allow D.
 * 
 * @param inNum 	 Number to check. (Required)
 * @return Returns a boolean. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 2, July 10, 2003 
 */
function IsScientific(inNum) {
	if(IsNumeric(inNum) AND (FindNoCase("E", inNum) OR FindNoCase("D",inNum))) return true;
	else return false;
}
</cfscript>