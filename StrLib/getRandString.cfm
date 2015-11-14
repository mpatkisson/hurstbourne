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
 * Returns a random alphanumeric string of a user-specified length.
 * 
 * @param stringLenth 	 Length of random string to generate. (Required)
 * @return Returns a string. 
 * @author Kenneth Rainey (kip.rainey@incapital.com) 
 * @version 1, February 3, 2004 
 */
function getRandString(stringLength) {
	var tempAlphaList = "a|b|c|d|e|g|h|i|k|L|m|n|o|p|q|r|s|t|u|v|w|x|y|z";
	var tempNumList = "1|2|3|4|5|6|7|8|9|0";
	var tempCompositeList = tempAlphaList&"|"&tempNumList;
	var tempCharsInList = listLen(tempCompositeList,"|");
	var tempCounter = 1;
	var tempWorkingString = "";
	
	//loop from 1 to stringLength to generate string
	while (tempCounter LTE stringLength) {
		tempWorkingString = tempWorkingString&listGetAt(tempCompositeList,randRange(1,tempCharsInList),"|");
		tempCounter = tempCounter + 1;
	}
	
	return tempWorkingString;
}
</cfscript>