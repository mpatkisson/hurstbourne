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
 * NonZero returns TRUE if a value (numeric or text) is not an empty string and is greater than 0.
 * 
 * @param string 	 Value to check. (Required)
 * @return Returns a boolean. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, December 23, 2002 
 */
function NonZero(string){
	if(string NEQ "" OR string GT 0) return true;
	return false;
}
</cfscript>