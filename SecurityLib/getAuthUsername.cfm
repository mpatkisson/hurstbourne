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
 Get the authenticated username from the cgi.auth_user or cgi.remote_user without the domain information.
 
 @return Returns a string. 
 @author Mike Tangorre (mtangorre@gmail.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="getAuthUsername" returntype="string" output="false">
	
	<cfset var username = "" />
	
	<cfif len(trim(cgi.auth_user))>
	
		<cfset username = trim(cgi.auth_user) />
	
	<cfelseif len(trim(cgi.remote_user))>
	
		<cfset username = trim(cgi.remote_user) />
	
	<cfelse>
	
		<!--- no string to work with --->
		<cfreturn trim(username) />
	
	</cfif>
	
	<!--- check username@some.domain --->
	<cfif find("@",username)>
	
		<cfreturn listFirst(username,"@") />
	
	<!--- check domain\username --->
	<cfelseif find("\",username)>
	
		<cfreturn listLast(username,"\") />
	
	<!--- no domain --->
	<cfelse>
	
		<cfreturn trim(username) />
	
	</cfif>
	
</cffunction>