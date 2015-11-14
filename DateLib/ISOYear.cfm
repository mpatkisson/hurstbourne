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
 * Returns the ISO correct year of a given date, necessary for dates from 29th Dec to 3rd Jan.
 * 
 * @param inputDate 	 The date to format. (Required)
 * @return Returns a string. 
 * @author Pete Gibb (peter.gibb@icaew.co.uk) 
 * @version 1, August 4, 2005 
 */
function ISOYear(inputDate) {
	var inputDay = dayOfWeek(inputDate);
	var yearNo = year(inputDate);
	
	/** If the inputdate IS 29th-31st December, the input year MAY need to be next year **/
	if((dateFormat(inputDate,"ddmm") is "2912" and dayOfWeek(inputDate) eq 2)
	or (dateFormat(inputDate,"ddmm") IS "3012" and listFind("2,3",dayOfWeek(inputDate),",") gt 0)
	or (dateFormat(inputDate,"ddmm") IS "3112" and listFind("2,3,4",dayOfWeek(inputDate),",") gt 0))
	{yearNo=year(inputDate)+1;}
	
	/** If the inputdate IS 1st - 3rd January, the input year MAY need to be previous year **/
	if((dateFormat(inputDate,"ddmm") is "0301" and dayOfWeek(inputDate) eq 1)
	or (dateFormat(inputDate,"ddmm") IS "0201" AND listFind("1,7",dayOfWeek(inputDate),",") gt 0)
	or (dateFormat(inputDate,"ddmm") IS "0101" and listFind("1,7,6",dayOfWeek(inputDate),",") gt 0))
	{yearNo=year(inputDate)-1;}
	
	return yearNo;
}
</cfscript>