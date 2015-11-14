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
 * Simply converts access yes/no or other boolean variables to 0/1 format, almost opposite of yesnoformat
 * 
 * @param value 	 The value to convert. (Optional)
 * @return Returns 1 or 0. 
 * @author Craig M. Rosenblum (crosenblum@gmail.com) 
 * @version 1, July 3, 2006 
 */
function booleanize(value) {
	if (not isboolean(value)) {
		value = replacenocase(value,'on',1);
		value = replacenocase(value,'off',0);
	}
	if (yesnoformat(value) eq 'Yes') value = 1;
	if (yesnoformat(value) eq 'No') value = 0;
	return value;
}
</cfscript>