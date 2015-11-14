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
 * Returns the 2 character english text ordinal for numbers.
 * 
 * @param num 	 Number you wish to return the ordinal for. (Required)
 * @return Returns a string. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, November 5, 2003 
 */
function GetOrdinal(num) {
  // if the right 2 digits are 11, 12, or 13, set num to them.
  // Otherwise we just want the digit in the one's place.
  var two=Right(num,2);
  var ordinal="";
  switch(two) {
       case "11": 
       case "12": 
       case "13": { num = two; break; }
       default: { num = Right(num,1); break; }
  }

  // 1st, 2nd, 3rd, everything else is "th"
  switch(num) {
       case "1": { ordinal = "st"; break; }
       case "2": { ordinal = "nd"; break; }
       case "3": { ordinal = "rd"; break; }
       default: { ordinal = "th"; break; }
  }

  // return the text.
  return ordinal;
}
</cfscript>