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
 * Works like the built-in function DollarFormat, but does no rounding.
 * 
 * @param inNum 	 Number to format. (Required)
 * @param default_var 	 Value to use if number isn't a proper number. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, September 16, 2002 
 */
function DollarFormat2(inNum) {
	var out_str             = "";
	var decimal_str         = "";

	var default_value = inNum;
	if(ArrayLen(Arguments) GTE 2) default_value = Arguments[2];

	if (not IsNumeric(inNum)) {
		return (default_value);
	} else {
		inNum = Trim(inNum);
		if(ListLen(inNum, ".") GT 1) {
			out_str = Abs(ListFirst(inNum, "."));
			decimal_str = "." & ListLast(inNum, ".");
		} else if (Find(".", inNum) EQ 1) {
			decimal_str = inNum;
		} else {
			out_str = Abs(inNum);
		}
		if (out_str NEQ "") {
			// add commas
			out_str = Reverse(out_str);
			out_str = REReplace(out_str, "([0-9][0-9][0-9])", "\1,", "ALL");
			out_str = REReplace(out_str, ",$", "");   // delete potential leading comma
			out_str = Reverse(out_str);
		}

		// add dollar sign (and parenthesis if negative)
		if(inNum LT 0) {
			return ("($" & out_str & decimal_str & ")");
		} else {
			return ("$" & out_str & decimal_str);
		}
	}
}
</cfscript>