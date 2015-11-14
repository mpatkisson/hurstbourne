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
 * Tests a string, one-dimensional array, or simple struct for possible SQL injection.
 * 
 * @param input 	 String to check. (Required)
 * @return Returns a boolean. 
 * @author Will Vautrain (vautrain@yahoo.com) 
 * @version 1, July 1, 2002 
 */
function IsSQLInject(input) {
	/*
	* The SQL-injection strings were used at the suggestion of Chris Anley [chris@ngssoftware.com]
	* in his paper "Advanced SQL Injection In SQL Server Applications" available for downloat at
	* http://www.ngssoftware.com/
	*/
	var listSQLInject = "select,insert,update,delete,drop,--,'";
	var arraySQLInject = ListToArray(listSQLInject);
	var i = 1;
	
	for(i=1; i lte arrayLen(arraySQLInject); i=i+1) {
		if(findNoCase(arraySQLInject[i], input)) return true;
	}
	
	return false;
}
</cfscript>