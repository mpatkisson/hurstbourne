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
 * Checks to see if a submitted letter is Upper or Lower Case.
 * 
 * @param character 	 The character to check. (Required)
 * @return Returns either &quot;upper&quot;, &quot;lower&quot;, or &quot;Not Alpha&quot;. 
 * @author Larry Juncker (larry@aljnet.net) 
 * @version 1, November 20, 2005 
 */
function isUpperLower(character) {
	if(asc(character) gte 65 and asc(character) lte 90) return "upper";
	else if(asc(character) gte 97 and asc(character) lte 122) return "lower";
 	return "Not Alpha"; 
}
</cfscript>