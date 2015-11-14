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
 * Searches a string for email addresses.
 * Based on the idea by Gerardo Rojas and the isEmail UDF by Jeff Guillaume.
 * New TLDs  
 * v3 fix by Jorge Asch
 * 
 * @param str 	 String to search. (Required)
 * @return Returns a list. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 3, June 13, 2011 
 */
function getEmails(str) {
	var email = "(['_a-z0-9-]+(\.['_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.((aero|coop|info|museum|name|jobs|travel)|([a-z]{2,3})))";
	var res = "";
	var marker = 1;
	var matches = "";
	
	matches = reFindNoCase(email,str,marker,marker);

	while(matches.len[1] gt 0) {
		res = listAppend(res,mid(str,matches.pos[1],matches.len[1]));
		marker = matches.pos[1] + matches.len[1];
		matches = reFindNoCase(email,str,marker,marker);		
	}
	return res;
}
</cfscript>