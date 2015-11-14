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

<!---
 Creates an HTTPS URL for the current page, or for given page information.
 
 @param domain 	 url to secure (Optional)
 @param path 	 page to secure (Optional)
 @param queryString 	 queryString for page (Optional)
 @param port 	 additional port to use in url (Optional)
 @return Returns a string 
 @author Jon Hartmann (jon.hartmann@gmail.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="GetSecureURL" output="false" returntype="string">
	<cfargument name="domain" typ="string" required="false" default="#cgi.server_name#" />
	<cfargument name="path" typ="string" required="false" default="#cgi.script_name#" />
	<cfargument name="queryString" typ="string" required="false" default="#cgi.query_string#" />
	<cfargument name="port" typ="string" required="false" default="#cgi.server_port#" />
	
	<cfset var HTTPSURL = "https://" & arguments.domain />
	
	<cfif IsNumeric(arguments.port)>
		<cfset HTTPSURL = HTTPSURL & ":" & arguments.port />
	</cfif>
	
	<cfset HTTPSURL = HTTPSURL & arguments.path />
	
	<cfif Len(arguments.queryString)>
		<cfset HTTPSURL = HTTPSURL & "?" & arguments.queryString />
	</cfif>
	
	<cfreturn HTTPSURL />
</cffunction>