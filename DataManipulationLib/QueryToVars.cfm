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
 * Change a row in a query to variables in a scope.
 * 
 * @param q 	 The query to use. 
 * @param scope 	 Scope to save data in. Defaults to "" or local scope. 
 * @param row 	 Row number to use. Defaults to 1. 
 * @return Returns an empty string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, March 11, 2002 
 */
function queryToVars(q){
	//first, an array of the column names for looping
	var cols = listToArray(q.columnList);
	//a var to use as iterator
	var ii = 1;
	//by default, use no scope
	var scope = "";
	//by default, use the first row
	var row = 1;
	//if there is a second argument, use that as the scope
	if(arrayLen(arguments) GT 1)
		scope = arguments[2] & ".";
	//if there is a third argument and it is numeric, use that as the row (make sure it is a positive integer)
	if(arrayLen(arguments) GT 2 and isNumeric(arguments[3]))
		row = ceiling(abs(arguments[3]));		
	//loop over the columns, making a variables for each one
	for(ii = 1; ii lte arrayLen(cols); ii = ii + 1)
		setVariable(scope & cols[ii],q[cols[ii]][row]);
	//return nothing
	return "";	
}
</cfscript>