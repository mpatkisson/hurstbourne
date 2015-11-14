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
 * Replaces a regular expression with newSubString from a specified starting position while ignoring case.
 * 
 * @param theString 	 The string to format. (Required)
 * @param regExpression 	 The regular expression to look for. (Required)
 * @param newSubString 	 The string to use as a replacement. (Required)
 * @param startIndex 	 Where to begin replacing. (Required)
 * @param theScope 	 pe   Number of replacements to make. Default is "ONE". Value can be "ONE" or "ALL." (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function REReplaceAtNoCase(theString, regExpression, newSubString, startIndex){
	var targetString  = "";
	var preString     = "";

	var theScope      = "ONE";
	if(ArrayLen(Arguments) GTE 5) theScope    = Arguments[5];

	if (startIndex LTE Len(theString)) {
		targetString = Right(theString, Len(theString)-startIndex+1);
		if (startIndex GT 1) preString = Left(theString, startIndex-1);
		return preString & REReplaceNoCase(targetString, regExpression, newSubString, theScope);
	} else {
		return theString;
	}
}
</cfscript>