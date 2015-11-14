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
 * This UDF is an extensible, easy to use pattern validator using regular expressions.
 * Rewrites by rcamden.
 * 
 * @param checkWhat 	 Name of the pattern to use. (Required)
 * @param str 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Chris Chay (itadept@earthlink.net) 
 * @version 2, January 15, 2003 
 */
function CheckPattern(checkWhat, str) {
	var rePattern=""; // Assign RE pattern to this variable
	switch (checkWhat){
		case "isEmail":
			rePattern="^([\w\d\-\.]+)@{1}(([\w\d\-]{1,67})|([\w\d\-]+\.[\w\d\-]{1,67}))\.(([a-zA-Z\d]{2,4})(\.[a-zA-Z\d]{2})?)$";
			break;
		case "isIP":
			rePattern="^(((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|0?[0-9]?[0-9])\.){3,3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|0?[0-9]?[0-9]))$";
			break;
		case "isFloat":
			rePattern="^[-+]?\d*\.?\d*$";
			break;
		case "isInteger":
			rePattern="^[+-]?\d+$";
			break;
		case "isUSPhone":
			rePattern="^((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}$";
			break;
		case "isUSCurrency":
			rePattern="^\$(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$";
			break;
		case "isDate":
			rePattern="^(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[1,3-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$";
			break;
		case "isCreditCard":
			rePattern="^((4\d{3})|(5[1-5]\d{2})|(6011))-?\d{4}-?\d{4}-?\d{4}|3[4,7]\d{13}$";
			break;
		case "isSSN":
			rePattern="^\d{3}-\d{2}-\d{4}$";
			break;
		case "isZipCode":
			rePattern="^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$";
			break;
		default:
			return("That pattern check is not available");
			break;
	}
	return reFindNoCase(rePattern,str);
}
</cfscript>