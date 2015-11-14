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
 * Retrieves the url for the current directory in full or relative format.
 * 
 * @param pathType 	 Format to return the path in.  Valid values are 'full' and 'relative'.  Returns the text string 'invalid paramter' if the parameter is not 'full' or 'relative'. Default value for the parameter is 'relative'.   
 * @return Returns a string. 
 * @author Spike (spike@spike.org.uk) 
 * @version 1, October 9, 2001 
 */
function GetHTTPDir() {
        var format = "";
	if (arraylen(arguments)) {
	 format = arguments[1];
		if (format EQ 'full') {
			return "http://#cgi.server_name##listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
		}
		else if (format EQ 'relative') {
			return "#listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
		}
		else {
			return 'invalid argument';
		}
	}
	else {
		return "#listDeleteAt(cgi.script_name,listlen(cgi.script_name,'/'),'/')#/";
	}
}
</cfscript>