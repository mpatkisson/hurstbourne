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
 * Converts a numeric column position to its Excel Column Name
 * 
 * @param columnName 	 Numeric column number. (Required)
 * @return Returns a string. 
 * @author Adam Tuttle (adam@fusiongrokker.com) 
 * @version 1, May 3, 2010 
 */
function excelColumnNumtoColumnName(columnNumber){
	var dividend = fix(arguments.columnNumber); //make sure input is an integer
	var columnName = '';
	var modulo = 0;
	//if dividend <= 0, an empty string will be returned
	while (dividend gt 0){
		modulo = (dividend - 1) mod 26;
		columnName = "#chr(65 + modulo)##columnName#";
		dividend = fix((dividend - modulo) / 26);
	}
	return columnName;
}
</cfscript>