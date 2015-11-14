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
 * Corrects rounding bug in DecimalFormat.
 * Minor update.
 * 
 * @param number 	 The number to format. (Required)
 * @return Returns a number. 
 * @author duncan cumming (duncan.cumming@alienationdesign.co.uk) 
 * @version 2, October 12, 2004 
 */
function DecimalFormatCorrectly(number) {
	var lhs=0;
	var rhs=0;
	var decLen = 0;
	var i = 0;
	
	if(ListLen(number, ".") EQ 2) {	//xxx.xxx
		lhs = ListFirst(number, ".");
		rhs = ListLast(number, ".");
	} else if (Find(".", Trim(number)) EQ 1) { // .xx
		rhs = number;
	} else if (Find(".", Trim(number)) EQ 0) {	// xx
		lhs = number;
	} else {
		return number;
	}
	
	if (NOT IsNumeric(lhs) OR NOT IsNumeric(rhs)) return number;
	
	for (i = 0; i LT 2; i=i+1) {
		if (Len(rhs) LT 2) rhs = rhs & "0";
	}
	
	// count how many digits > 2dp there are
	decLen = Len(rhs) - 2; 

	// divide by this number of zeroes
	for (i = 0; i LT decLen; i=i+1) {
		rhs = rhs / 10;
	} 

	// round it
	rhs = Round(rhs);

	if (rhs GTE 100) { 
		rhs = 0;
		lhs = lhs + 1;
	}

	// pad with zeros if necessary
	if (rhs LT 10) {
		rhs = "0" & rhs;
	}	
	
	lhs = NumberFormat(lhs);
	
	return (lhs & "." & rhs);
}
</cfscript>