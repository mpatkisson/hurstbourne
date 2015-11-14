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
 * Converts an HTML (hex) color code to gray.  An optional second argument allows for conversion to a web-safe color in the same step.
 * 
 * @param hex_color 	 6 character hex color code you want converted to grayscale. 
 * @param web_safe 	 Boolean.  Indicates whether to return the closest web-safe grayscale value.  Default is No. 
 * @return Returns a string. 
 * @author Sierra Bufe (sierra@brighterfusion.com) 
 * @version 1.0, November 22, 2001 
 */
function Grayscale(hex_color) {
  // strip out any leading pound signs
  var clean_hex = replace(hex_color,'##','','ALL');
  // parse out rgb values, convert them to decimal, and make into a list
  var rgb = InputBaseN(Left(clean_hex,2),16) & "," & InputBaseN(Mid(clean_hex,3,2),16) & "," & InputBaseN(Right(clean_hex,2),16);
  // find average value from the list
  var gray = ArrayAvg(ListToArray(rgb));
  // check to see if a web_safe result is preferred
  if ((ArrayLen(Arguments) GT 1) AND Arguments[2])
    gray = Round(gray / 51) * 51;

  // convert gray to hexadecimal and pad with a zero if necessary
  gray = FormatBaseN(gray,16);
  if (len(gray) is 1) gray = "0" & gray;
    // return gray value as a new 6-digit hex color
    return gray & gray & gray;
}
</cfscript>