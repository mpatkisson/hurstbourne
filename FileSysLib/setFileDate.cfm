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
 * Updates the dateLastModified file attribute.
 * 
 * @param filename 	 Absolute filename. (Required)
 * @param newDate 	 Date/Time to assign. Defaults to current time. (Optional)
 * @return Returns a boolean. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, June 14, 2011 
 */
function setFileDate(filename){
	var newDate = Now();
	if (ArrayLen(Arguments) GTE 2) { newDate = arguments[2]; }
	if (not isdate(newDate)) { return false; }
	else if (newDate LT '1/1/1970') { return false; }
	if (not fileExists(filename)) { return false; }
	newDate = DateDiff("s", DateConvert("utc2Local", "January 1 1970 00:00"), newDate) * 1000;
	return CreateObject("java","java.io.File").init(JavaCast("string",filename)).setLastModified(newDate);
}
</cfscript>