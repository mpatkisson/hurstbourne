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
 * Takes an array or struct of basic values and returns and HTML-formatted string.
 * 
 * @param emData 	 Struct or array of strings. (Required)
 * @param beginString 	 String to place before each stirng in emData. (Optional)
 * @param endString 	 String to place after each stirng in emData. (Optional)
 * @return Returns a string. 
 * @author Will Vautrain (vautrain@yahoo.com) 
 * @version 1, May 2, 2002 
 */
function MessageListDisplay(emData) {
	
	var returnStr = "";
	var beginStr = "<p style=""color : red;"">";
	var endStr = "</p>";
	var s = ArrayNew(1);
	var i = 1;
	
	if (ArrayLen(Arguments) gt 1) {
	
		beginStr = Arguments[2];	
	}
	
	if (ArrayLen(Arguments) gt 2) {
	
		endStr = Arguments[3];	
	}
	
	if (IsArray(emData) and not ArrayIsEmpty(emData)) {

		i = 1;
		while (i lte ArrayLen(emData)) {
			returnStr = returnStr & beginStr & emData[i] & endStr;
			i = i + 1;
			
		}
	} 
	
	if (IsStruct(emData) and not StructIsEmpty(emData)) {

		s = StructKeyArray(emData);
		i = 1;
		while (i lte ArrayLen(s)) {
			returnStr = returnStr & beginStr & StructFind(emData, s[i]) & endStr;
			i = i + 1;
		}
	}
	
	return returnStr;
}
</cfscript>