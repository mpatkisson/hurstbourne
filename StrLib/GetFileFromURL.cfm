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
 * Returns the file name from a specified URL.
 * 
 * @param this_url 	 URL to parse. 
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, March 4, 2002 
 */
function GetFileFromURL(this_url) {
	var i               = 0;
	var cnt             = 0;
	var re_found_struct = "";
	var this_file_name  = "";
	var num_dots        = "";
	
	this_url = trim(this_url);
	
	// find the last "/" character, after the scheme
	if(not Find("/", this_url)) {
		i=1;
	} else {
		if(Find("://", this_url)){
			i = Find("://", this_url);
			cnt = Len(this_url) -i -2;
			if(cnt LT 1) cnt=1;
			this_url = Right(this_url, cnt);   // now the scheme is chopped off
		}
		i = Len(this_url) - Find("/", Reverse(this_url)) +2;
	}
	
	re_found_struct = REFind("([^##\?]+\.[^##\?]+)", this_url, i, "True");
	if (re_found_struct.pos[1] GT 0) {
		this_file_name = Mid(this_url, re_found_struct.pos[2], re_found_struct.len[2]);
		num_dots = (Len(this_file_name) - Len(Replace(this_file_name, ".", "", "ALL")));
		if ( ((not Find("/", this_url)) and (num_dots GT 1)) or (FindOneOf("@:", this_file_name)) ){
			// since this URL doesn't contain any "/" and since the "file" has two or more dots (".")
			// or if the filename contains a "@" or a ":"
			// then this filename is probably actually a host name
			return ""; 
		}
		return this_file_name;
	} else {
		return "";
	}
}
</cfscript>