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
 * Clean variables, such as form input, to modify values that may have been entered to perform e-mail injection.
 * 
 * @param str 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Tony Brandner (tony@brandners.com) 
 * @version 1, February 3, 2006 
 */
function trimFalseEmailHeaders(str) {
	str = replaceNoCase(str, "Content-Type:", "content-type;", "ALL" );
	str = replaceNoCase(str, "MIME-Version:", "mime-version;", "ALL" );
	str = replaceNoCase(str, "To: ", "to; ", "ALL" );
	str = replaceNoCase(str, "From: ", "from; ", "ALL" );
	str = replaceNoCase(str, "bcc: ", "bcc; ", "ALL" );
	str = replaceNoCase(str, "Subject: ", "subject; ", "ALL" );
	return str;
}
</cfscript>