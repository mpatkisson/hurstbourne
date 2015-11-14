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
 * Convert fractions to decimal.
 * 
 * @param fraction 	 Value to convert to decimal. (Required)
 * @return Returns a number. 
 * @author Trevor Orr (fractorr@yahoo.com) 
 * @version 1, August 16, 2008 
 */
function fractionToDecimal(fraction) {
	var thisNumber		= 0;
	var thisFraction	= 0;
	var thisOut 		= "0.0";

	if (ListLen(arguments.fraction, " ") EQ 1) {
		if (Trim(arguments.fraction) contains  "/") {
			thisOut = Val(ListFirst(arguments.fraction, "/")) / Val(ListLast(arguments.fraction, "/"));
		} else {
			thisOut = Val(Trim(arguments.fraction));
		}
	} else {
		if (Trim(ListLast(arguments.fraction, " ")) contains  "/") {
			thisOut = Val(ListFirst(arguments.fraction, " "));
			thisOut = thisOut + Val(ListFirst(ListLast(arguments.fraction, " "), "/")) / Val(ListLast(ListLast(arguments.fraction, " "), "/"));
		} else {
			thisOut = Val(Trim(arguments.fraction));
		}
	}

	return thisOut;
}
</cfscript>