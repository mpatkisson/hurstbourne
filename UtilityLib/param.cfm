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
 * Function to duplicate the cfparam for scoped variables.
 * 
 * @param scope 	 Scope to check. (Required)
 * @param varname 	 Variable name to param. (Required)
 * @param value 	 Value to use. Defaults to a space. (Optional)
 * @return Returns the value of the variable. 
 * @author Robert Blackburn (skorpiun@gmail.com) 
 * @version 1, February 13, 2006 
 */
function param(scope, varname) {
	var value = "";
	
	if(arrayLen(arguments) gt 2) {
		value = arguments[3];
	}
	
	if(NOT structKeyExists(arguments.scope, arguments.varname) ) {
		arguments.scope[arguments.varname] = value;
	}
	
	return arguments.scope[arguments.varname];
}
</cfscript>