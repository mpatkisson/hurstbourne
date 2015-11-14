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
 * Splits a numeric value into integer and decimal parts
 * version 0.1 by Darwan Leonardo Sitepu
 * version 1.0 by Adam Cameron. Renamed function, simplified logic, fixed a data truncation bug, returns a struct rather than a query now.
 * 
 * @param number 	 A numeric value to split into integer/decimal parts (Required)
 * @return Returns a struct with keys integer and decimal, containing the relevant parts of the original number 
 * @author Darwan Leonardo Sitepu (dlns2001@yahoo.com) 
 * @version 1, August 26, 2012 
 */
public struct function splitNumber(required numeric number){
	var result = {};
	result.integer = listFirst(number, ".");
	if (listLen(number, ".") > 1){
		result.decimal = listRest(number, ".");
	}else{
		result.decimal = 0;
	}
	return result;
}
</cfscript>