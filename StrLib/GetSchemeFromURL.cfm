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
 * Returns the scheme from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, February 21, 2002 
 */
function GetSchemeFromURL(this_url) {
	var i = 0;
	
	this_url = trim(this_url);
	
	i = Find("://", this_url, 1);
	if (i LT 1) {
		return ""; // relative url = no scheme   (ex: "../dir1/filename.html" or "/dir1/filename.html")
	} else {
		return Left(this_url, i+2);  // return the "://" and everything to the left of it
	}
}
</cfscript>