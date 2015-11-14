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
 * Pads a string to a length of n characters.  Padding is from the left.
 * Based on the UDF PadString() by Rob Brooks-Bilson (rbils@amkor.com).
 * 
 * @param string 	 String you want to pad. (Required)
 * @param char 	 Character to use as the padding. (Required)
 * @param count 	 Total number of characters to pad the string out to. (Required)
 * @return Returns a string. 
 * @author Stephen Rittler (scrittler@etechsolutions.com) 
 * @version 1, June 18, 2002 
 */
function PadStringToLen(string, char, count)
{
  var strLen = len(string);
  var padLen = count - strLen;
  if (padLen lte 0) {
    return string;
  }
  else {
    return RepeatString(char, padLen) & string;
  }
}
</cfscript>