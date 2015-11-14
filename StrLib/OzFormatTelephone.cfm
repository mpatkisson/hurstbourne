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
 * Translates a 10 digit Australian telephone/facsimile number (either in STD or Toll Free format) into an Australian formatted telephone number.
 * 
 * @param phoneNumber 	 Number to format. (Required)
 * @return Returns a string. 
 * @author Peter Tilbrook (peter@coldgen.com) 
 * @version 1, February 26, 2004 
 */
function OzFormatTelephone(PhoneNumber) {
    if (not isNumeric(PhoneNumber)) return "";
	if (left(PhoneNumber,1) eq 0) return "(" & left(PhoneNumber, 2) & ")&nbsp;" & mid(PhoneNumber, 4, 4) & "-" & right(PhoneNumber, 4);
	else if (left(PhoneNumber,1) neq 0) return left(PhoneNumber, 4) & "-" & mid(PhoneNumber, 3, 3) & "-" & right(PhoneNumber, 3);
	return "";
}
</cfscript>