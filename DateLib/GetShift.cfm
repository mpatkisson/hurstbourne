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
 * Returns the work shift for a sequence based work schedule.
 * v2 by Raymond Camden
 * 
 * @param Date 	 Date to return the shift for. (Required)
 * @param StartDate 	 Start date of the sequence. (Required)
 * @param Sequence 	 Comma delimited list defining the shift sequence. (Required)
 * @return Returns a string. 
 * @author Rob Rusher (rob@robrusher.com) 
 * @version 2, December 17, 2002 
 */
function GetShift(date, startDate, sequence) {
  var daysDiff = DateDiff("d",startDate,date);
  var key = daysDiff mod listLen(sequence) + 1;
  return listGetAt(sequence,key);
}
</cfscript>