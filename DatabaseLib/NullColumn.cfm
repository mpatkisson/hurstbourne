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
 * Useful in constructing SQL statements that must handle empty strings as NULLs.
 * Rewritten to use one UDF by RCamden
 * 
 * @param columnValue 	 The value to test.  (Required)
 * @param dataType 	 Allows you to specify 'alpha' or 'numeric'. If alpha, value is wrapped in single quotes. Default is alpha. (Optional)
 * @return Returns a string. 
 * @author Charles McElwee (cmcelwee@etechsolutions.com) 
 * @version 1, September 20, 2002 
 */
function NullColumn(columnValue) {
	var dataType = "alpha";
	
	if(arrayLen(arguments) gte 2) dataType = arguments[2];
	if(trim(columnValue) eq "") return "NULL";
 	else if(dataType is "alpha") return "'" & columnValue & "'";
	else return columnValue;
}
</cfscript>