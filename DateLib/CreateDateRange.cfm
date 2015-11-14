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
 * Creates a date range array.
 * 
 * @param startdate 	 The starting date. (Required)
 * @param ndays 	 The number of days. This will include the starting date. (Required)
 * @param dtformat 	 Date format. Defaults to "mm/dd/yyyy" (Optional)
 * @return Returns an array. 
 * @author Casey Broich (cab@pagex.com) 
 * @version 1, May 20, 2003 
 */
function CreateDateRange(startdate,ndays) {
  var dtarray = arraynew(1);
  var i = 1;
  var ndate = "";
  var dtformat = "mm/dd/yyyy";
  
  if (ArrayLen(arguments) gte 3) dtformat = arguments[3];
  ndate = dateformat(startdate,"mm/dd/yyyy") - 1;
  for(i = 1; i lte ndays; i = i+1) {
    ndate = dateformat(ndate+1,dtformat);
    arrayappend(dtarray, ndate);
  }
  return dtarray;
}
</cfscript>