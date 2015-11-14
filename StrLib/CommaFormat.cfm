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
 * Adds commas after every third non-ending digit to the left of the decimal point.
 * 
 * @param inNum 	 Number to format. (Required)
 * @param default 	 If number isn't numeric, display default instead. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, August 26, 2002 
 */
function CommaFormat(inNum) {
	var outStr  = "";
	var decStr  = "";

	var default_value = inNum;
	if(ArrayLen(Arguments) GTE 2) default_value = Arguments[2];

	if (not IsNumeric(inNum)) {
		return (default_value);
	} else {
		if(ListLen(inNum, ".") GT 1) {
			outStr = ListFirst(inNum, ".");
			decStr = "." & ListLast(inNum, ".");
		} else if (Find(".", Trim(inNum)) EQ 1) {
			decStr = inNum;
		} else {
			outStr = inNum;
		}
		if (Trim(outStr) NEQ "") {
			outStr = Reverse(outStr);
			outStr = REReplace(outStr, "([0-9][0-9][0-9])", "\1,", "ALL");
			outStr = REReplace(outStr, ",$", "");   // delete potential leading comma
			outStr = REReplace(outStr, ",([^0-9]+)", "\1");   // delete leading comma w/ spaces in front of
			outStr = Reverse(outStr);
		}
		return (outStr & decStr);
	}
}
</cfscript>