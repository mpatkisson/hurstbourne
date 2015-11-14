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
 * When given a list of values, returns a list of element locations that match a given regular expression.
 * 
 * @param reg_expr 	 The regular expression for the search. (Required)
 * @param tlist 	 The list. (Required)
 * @param delims 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns a list of matches. 
 * @author Robert Munn (robert.munn@alumni.tufts.edu) 
 * @version 1, October 19, 2004 
 */
function REListFindNoCaseMultiple(reg_expr,tlist){
 	var results="";
	var expr_location = 0;
	var i = 1;
	var delims = ",";
	
	if(arrayLen(arguments) gt 2) delims = arguments[3];
	
	for(; i lte listlen(tlist,delims); i=i+1){
	    expr_location = REFindNoCase(reg_expr,listgetat(tlist,i,delims));
	    if(expr_location gt 0) results=listappend(results,i);
	}    		
	return results;
}
</cfscript>