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
 * A quick way to test if a string is a URL.
 * Regex by Gruber: http://daringfireball.net/2010/07/improved_regex_for_matching_urls
 * 
 * @param stringToCheck 	 The string to check. (Required)
 * @return Returns a boolean. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 2, August 5, 2010 
 */
function isURL(stringToCheck){
       var URLRegEx = "(?i)\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'"".,<>?«»“”‘’]))";
       return isValid("regex", stringToCheck, URLRegex);
}
</cfscript>