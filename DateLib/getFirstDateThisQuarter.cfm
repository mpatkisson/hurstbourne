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
 * Returns a date object with the first date of the current quarter.
 * 
 * @return Returns a date. 
 * @author Scott Glassbrook (cflib@vox.phydiux.com) 
 * @version 1, August 11, 2005 
 */
function getFirstDateThisQuarter() {
	if(now() gte createDateTime(DatePart("yyyy", now()), 01, 01, 00, 00, 00) and now() lte createDateTime(DatePart("yyyy", now()), 03, 31, 23, 59, 59)) return createDate(datePart("yyyy", now()), 01, 01);
	else if (now() gte createDateTime(DatePart("yyyy", now()), 04, 01, 00, 00, 00) and now() lte createDateTime(DatePart("yyyy", now()), 06, 30, 23, 59, 59)) return createDate(datePart("yyyy", now()), 04, 01);
	else if (now() gte createDateTime(DatePart("yyyy", now()), 07, 01, 00, 00, 00) and now() lte createDateTime(DatePart("yyyy", now()), 09, 30, 23, 59, 59)) return createDate(datePart("yyyy", now()), 07, 01);
	else return createDate(datePart("yyyy", now()), 10, 01);
}
</cfscript>