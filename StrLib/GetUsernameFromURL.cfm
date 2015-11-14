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
 * Returns the username from a specified URL.
 * Modified to handle differences in regex in cf5/mx. Thanks to Tom Lane for pointing out the issue.
 * 
 * @param this_url 	 URL to parse. (Required)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 2, August 23, 2002 
 */
function GetUsernameFromURL(this_url) {
	var first_char       = "";
	var re_found_struct  = "";
	var num_expressions  = 0;
	
	this_url = trim(this_url);
	
	first_char = Left(this_url, 1);
	if (Find(first_char, "./")) {
		return "";   // relative URL = no username (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else if(Find("://", this_url)){
		// absolute URL    (ex: "ftp://user:pass@ftp.host.com")
		re_found_struct = REFind("(([^:@]*:)[^:@]*@)|([^:@]*@)", this_url, Find("://", this_url)+3, "True");
	} else {
		// abbreviated URL (ex: "user:pass@ftp.host.com")
		re_found_struct = REFind("(([^:@]*:)[^:@]*@)|([^:@]*@)", this_url, 1, "True");
	}
	
	if (re_found_struct.pos[1] GT 0) {
		num_expressions = ArrayLen(re_found_struct.pos);
		if(re_found_struct.pos[num_expressions] is 0) num_expressions = num_expressions - 1;
		return Mid(this_url, re_found_struct.pos[num_expressions], re_found_struct.len[num_expressions]-1);
	} else {
		return "";
	}
}
</cfscript>