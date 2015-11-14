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
 * Adds delimiting character(s) before capital letters in interCap strings.
 * 
 * @param str 	 String to format. (Required)
 * @param delimiter 	 Delimiter used to format string. (Required)
 * @param capFirst 	 Boolean used to determine if first character should be set to uppercase. (Required)
 * @return Returns a string. 
 * @author Rachel Maxim (rmaxim@gmail.com) 
 * @version 1, July 9, 2008 
 */
function delimitInterCap(str,delimiter,capFirst) {
	var newStr = '';
	var currentChar = '';
	var replaceStr = '';
	var i = 0;
	//should the first letter be upper case?
	if (isBoolean(capFirst) and capFirst is true) {
		newStr = uCase(left(str,1));
	} else {
		newStr = left(str,1);
	}
	//loop over each character in the string starting with the second
	for (i = 2; i lte len(str); i = i + 1) {
		//get the character at this index
		currentChar = mid(str,i,1);
		//search for capital letters
		if  (reFind('[A-Z]',currentChar)) {
			//if capital, prepend with delimiter
			replaceStr = delimiter & currentChar;
			//append to the new string
			newStr = newStr & replaceStr;
		} else {
			//append original character to the new string
			newStr = newStr & currentChar;
		}
	}
	return newStr;
}
</cfscript>