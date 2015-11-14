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
 * Very simple function to display either the plural or singular form for a numeric that is passed in.
 * 
 * @param quantity 	 Quantity. (Required)
 * @param singular 	 Singular version of the string. (Required)
 * @param plural 	 Plural version of the string. (Required)
 * @return Returns a string. 
 * @author Tony Felice, Ken Fricklas (sites@breckcomm.com; ken@breckcomm.com) 
 * @version 1, February 18, 2004 
 */
function pluralize(quantity, singular, plural){
	return IIF(quantity EQ 1, DE(singular), DE(plural));
}
</cfscript>