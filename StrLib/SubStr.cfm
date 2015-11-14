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
 * Returns the substring of a string. It mimics the behaviour of the homonymous php function so it permits negative indexes too.
 * 
 * @param buf 	 The string to parse. (Required)
 * @param start 	 The start position index. If negative, counts from the right side. (Required)
 * @param length 	 Number of characters to return. If not passed, returns from start to end (if positive start value). (Optional)
 * @return Returns a string. 
 * @author Rudi Roselli Pettazzi (rhodion@tiscalinet.it) 
 * @version 2, July 2, 2002 
 */
function SubStr(buf, start) {
    // third argument (optional)
    var length = 0;
    var sz = 0;
		
    sz = len(buf);
    
    if (arrayLen(arguments) EQ 2) {

		if (start GT 0) {
		    length = sz;
		} else if (start LT 0) {
		    length = sz + start;
		    start = 1;
		}
	
    } else {
    
		length = Arguments[3];
		if (start GT 0) {
		    if (length LT 0)   length = 1+sz+length-start;
		} else if (start LT 0) {
		    if (length LT 0) length = length-start;
		    start = 1+sz+start;
		    
		}
    } 
    
    if (isNumeric(start) AND isNumeric(length) AND start GT 0 AND length GT 0) return mid(buf, start, length);
    else return "";
}
</cfscript>