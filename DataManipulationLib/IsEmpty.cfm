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
 * Check if a variable is set and has a value.
 * Mods by RCamden to add support for struct/query
 * 
 * @param varName 	 Variable to check for. (Required)
 * @return Returns a boolean. 
 * @author Fabio Serra (faser@faser.net) 
 * @version 1, July 10, 2003 
 */
function isEmpty(varName) {
	var ptr = "";
	
	if(not isDefined(varName)) return true;
	ptr = evaluate(varName);
	
	if(isSimpleValue(ptr)) {
		if(not len(ptr)) return true;
	} else if(isArray(ptr)) {
		if(arrayIsEmpty(ptr)) return true;
	} else if(isStruct(ptr)) {
		if(structIsEmpty(ptr)) return true;
	} else if(isQuery(ptr)) {
		if(not ptr.recordCount) return true;
	}
		
	return false;
}
</cfscript>