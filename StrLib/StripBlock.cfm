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
 * Removes all characters in a string between two characters.
 * 
 * @param strString 	 String to modify. (Required)
 * @param strFirstChar 	 Character to begin removal. (Required)
 * @param strLastChar 	 Character to end removal. (Required)
 * @param strScope 	 ALL or ONE. Signifies how many replacements to make. Default is ALL. (Optional)
 * @return Returns a string. 
 * @author Neal Barnett (nealb@800wine.com) 
 * @version 1, June 21, 2002 
 */
function StripBlock(strString,strFirstChar,strLastChar) 
{
	// Special Chars - Don't include ] (end-bracket) since it must be the
	// first character within brackets [ ] in the regular expression
	var strSpecialChars = "+*?.[^$(){}|\&##-";
	
	// Default to replace all blocks in string unless they passed a scope
	var strScope = "ALL";  
	if (ArrayLen(Arguments) gt 3)
	  	strScope = Arguments[4];
		
	// Escape the start and end chars if they're special
	if (FindNoCase(strFirstChar,strSpecialChars)) 
		strFirstChar = "\" & strFirstChar;
	if (FindNoCase(strLastChar,strSpecialChars)) 
		strLastChar = "\" & strLastChar;

	return REReplaceNoCase(strString,strFirstChar & "[^" & strLastChar & "]*" & strLastChar,"","#strScope#");
}
</cfscript>