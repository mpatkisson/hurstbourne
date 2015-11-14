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
 * Limits a string from the center inserting &quot;...&quot;
 * 
 * @param sString 	 string to use (Required)
 * @param nLimit 	 max length of string to use (Required)
 * @return Returns a string 
 * @author Joshua Rountree (joshua@remote-app.com) 
 * @version 0, May 9, 2009 
 */
function midLimit(sString,nLimit) {
	var nLength = Len(sString);
	var nPercent = nLimit/nLength;
	var nStart = Round(nLimit * .5);
	var nRemoveCount = (nLength - nLimit);
	var sResult = "";
	
	if(nLength GT nLimit) {
		sResult = RemoveChars(sString,nStart,nRemoveCount+3);
		sResult = Insert("...",sResult,nStart-1);
	} else {
		sResult = sString;
	}
	
	return sResult;
}
</cfscript>