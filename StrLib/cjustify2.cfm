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
 * Same as built-in CJustify(), but allows optional parameter character to pad with.
 * version 1.0 by Al Everett
 * 
 * @param string 	 String to justify (Required)
 * @param length 	 Length of field (Required)
 * @param padChar 	 Character to use for padding (Optional)
 * @return A string, center-justified to occupy the specified field length 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 1.0, September 16, 2012 
 */
function cJustify2(string,length) {
	var padChar = " ";
	var padLeftCount = 0;
	var padRightCount = 0;
	if (arrayLen(arguments) GT 2) {
		padChar=left(arguments[3],1);
	}
		
	if (len(string) LT length) {
		padLeftCount = (arguments.length - len(arguments.string)) \ 2; // integer divide by 2 the number of characters for padding
		padRightCount = arguments.length - len(arguments.string) - padLeftCount; // take whatever is left over and put on the right
	}
		
	return repeatString(padChar,padLeftCount) & arguments.string & repeatString(padChar,padRightCount);
}
</cfscript>