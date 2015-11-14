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
 * Returns default value if primary value is empty.
 * Based on ValueOrSpace by David Grant (david@insite.net)
 * 
 * @param thisValue 	 Value to check. (Required)
 * @param defaultValue 	 Value to use if thisValue is empty. Defaults to a non-breaking space. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, April 29, 2003 
 */
function ThisOrThat(thisValue) {
	var defaultValue = "&nbsp;";
	if(arrayLen(arguments) gte 2) defaultValue = arguments[2];
	if (Len(Trim(thisValue)) LT 1) return defaultValue;
	return thisValue;
}
</cfscript>