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
 * Checks to see if the current page is being run on a secure server.
 * 
 * @param localServers 	 If the current server matches one of the servers in this list, the UDF will return true. Defaults to an empty string. (Optional)
 * @return Returns a boolean. 
 * @author Mike Hughes (mike@gne-ws.com) 
 * @version 1, February 17, 2004 
 */
function IsSecureSite() {
	if(arrayLen(arguments)) localServers = arguments[1]; 
	if(cgi.server_port_secure OR listFindNoCase(localServers, cgi.server_name)) return true;
	else return false;
}
</cfscript>