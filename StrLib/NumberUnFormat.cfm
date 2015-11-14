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
 * Removes all non-essential formatting from a number.
 * 
 * @param inStr 	 String to format. (Required)
 * @param default_value 	 Used if the formatted string is empty. Defaults to inStr. (Optional)
 * @return Returns a number or string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, December 23, 2002 
 */
function NumberUnFormat(inStr) {
	var outNum = 0;
	var default_value = inStr;

	if(ArrayLen(Arguments) GTE 2) default_value = Arguments[2];

	outNum = REReplace(inStr,"[^0-9\.\-]",'','ALL');
	if (Len(outNum) LT 1) {
		outNum = default_value;
	}

	return outNum;
}
</cfscript>