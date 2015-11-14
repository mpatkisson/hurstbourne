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
 * Checks the strength of a user supplied password.
 * 
 * @param pwString 	 String to check. (Required)
 * @return Returns a struct. 
 * @author charlie griefer (charlie@griefer.com) 
 * @version 1, October 14, 2008 
 */
function pwStrength(pwString) {
	var retStruct = structNew();

	retStruct.originalString	= arguments.pwString;
	retStruct.originalLength	= len(arguments.pwString);
	retStruct.numericVals		= len(rereplace(pwString, '[^0-9]', '', 'all'));
	retStruct.alphas			= len(rereplaceNoCase(pwString, '[^a-z]', '', 'all'));
	retStruct.alphaUppers		= len(rereplace(pwString, '[^A-Z]', '', 'all'));
	retStruct.alphaLowers		= len(rereplace(pwString, '[^a-z]', '', 'all'));
	retStruct.badChars			= len(rereplace(pwString, '[\w]', '', 'all'));
	
	return retStruct;
}
</cfscript>