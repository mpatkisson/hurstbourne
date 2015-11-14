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
 * Finds all occurrences of a substring in a string.
 * Fix by RCamden to make start optional.
 * 
 * @param substring 	 String to search for. (Required)
 * @param string 	 String to parse. (Required)
 * @param start 	 Starting position. Defaults to 1. (Optional)
 * @return Returns an array. 
 * @author Jeremy Rottman (rottmanj@hsmove.com) 
 * @version 2, July 29, 2008 
 */
function findALL(substring,string) {
	var findArray = arrayNew(1);	
	var start = 1;	
	var posStart = "";
	var i = 1;
	var newPos = "";
	
	if(arrayLen(arguments) gte 3) start = arguments[3];

	posStart = find(substring,string,start);
	
	if(posStart GT 0){
		findArray[i] = posStart;
		while(posStart gt 0 ){
			posStart = posStart + 1;
			newPos = find(substring,string,posStart);
			if(newPos gt 0){
				i = i + 1;
				findArray[i] = newPos;
				posStart = newPos;
			}else{
				posStart = 0;
			}
		}
	}else{
		return 0;
	}
	return findArray;
}
</cfscript>