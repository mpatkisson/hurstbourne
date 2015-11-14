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
 * Basic padding function that allows user to decide which side of the submitted string that the characters should be added to (via L or R).
 * 
 * @param string 	 String to pad. (Required)
 * @param char 	 Character to use as pad. (Required)
 * @param number 	 Number of characters to pad. (Required)
 * @param charD 	 Direction to pad. Should be "L" (left) or "R" (right). Defaults to R. (Optional)
 * @return Returns a string. 
 * @author Ron Gambill (rgambill@hotmail.com) 
 * @version 1, May 9, 2003 
 */
function padDirection(string,char,number) {
   // set up variables
   var strLen = len(string);
   var padLen = number - strLen;
   var returnValue = string;
   var charD = "R";

   if(arrayLen(arguments) gte 4) charD = arguments[4]; 
   if (strLen gte number) return string;
   
   if (charD eq "R") return string & RepeatString(char, padLen);
   else return RepeatString(char, padLen) & string;
}
</cfscript>