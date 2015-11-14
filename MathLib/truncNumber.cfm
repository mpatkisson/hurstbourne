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
 * Cuts a number to a certain amount of decimal places without rounding.
 * 
 * @param input 	 Decimal number. (Required)
 * @param decimals 	 Number of decimals to the right of the period. Defaults to 2. (Optional)
 * @return Returns a number. 
 * @author Tony Monast (tony@ckm9.com) 
 * @version 1, June 15, 2006 
 */
function truncNumber(input) {
	var decimals = 2;
	var regex = "";
	var st = "";
	if(arrayLen(arguments) EQ 2) decimals = arguments[2];
	regex = "^\d*(.\d{1," & decimals & "})?";
	st = reFind(regex,input,1,true);
	return mid(input,st.pos[1],st.len[1]);
}
</cfscript>