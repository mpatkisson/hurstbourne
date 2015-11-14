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
 * Counts how many different chars are in a string.
 * removed use of arguments. to make it cf5 compat
 * 
 * @param string 	 String to check. (Required)
 * @param caseSensitive 	 Determines if case sensitivity is used. Defaults to false. (Optional)
 * @return Returns a number. 
 * @author Bjorn Jensen (public.cflib@saghian.com) 
 * @version 1, February 6, 2004 
 */
function differentChars(string){
	var iCount = 0;
	var i = 0;
	var sChars = "";
	var sChar = "";
	var caseSensitive = false;

	if (arrayLen(arguments) eq 2 and isBoolean(arguments[2]) and arguments[2]) {
		caseSensitive = true;
	}
	
	for(i=1;i lte len(string);i=i+1){
		sChar = mid(string, i, 1);
		if (caseSensitive and not find(sChar, sChars)){
			sChars = sChars & sChar;
			iCount = iCount+1;
		} else if (not caseSensitive and not findNoCase(sChar, sChars)){
			sChars = sChars & sChar;
			iCount = iCount+1;
		}
	}

	return iCount;
}
</cfscript>