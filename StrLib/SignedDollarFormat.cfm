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
 * Returns amount signed and dollar formatted.
 * 
 * @param amount 	 Amount to be formatted. 
 * @return Returns a string. 
 * @author David Grant (david@insite.net) 
 * @version 1, September 13, 2001 
 */
function signedDollarFormat(amount) {
	var sign = "";
	if (amount gt 0) sign = "+";
	else if (amount lt 0) sign = "-";
	amount = sign & dollarFormat(amount);
	return reReplace(amount,"\(|\)","","ALL"); //get rid of parenthesis
}
</cfscript>