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
 * Same as built-in RJUSTIFY, but allows optional parameter character to pad with.
 * 
 * @param string 	 String to manipulate. (Required)
 * @param length 	 Length of pad. (Required)
 * @return Returns a string. 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 0, December 21, 2011 
 */
function rjustify2(string,length) {
	var padChar = " ";
	if (arrayLen(arguments) GT 2) {
		padChar=left(arguments[3],1);
	}
		
	return repeatString(padChar,max(0,arguments.length - len(arguments.string))) & arguments.string;
}
</cfscript>