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
 * Translates a 9 digit string into a social security number.
 * 
 * @param string 	 String to be modified. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, July 16, 2001 
 */
function FormatSSN(str)
{
  var SSN = "";
  if (Not IsNumeric(str)) return "Error, str must be numeric";
  if (Len(Str) NEQ 9) return "Error, str must be 9 digits long";
  SSN = ReReplace(str,'([0-9]{3})([0-9]{2})([0-9]{4})','\1-\2-\3');
  return SSN;
}
</cfscript>