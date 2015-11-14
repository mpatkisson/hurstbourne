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
 Does a simple Twitter lookup for a user.
 Added a success flag - thx Ben Nadel.
 
 @param screenname 	 Screen name to look up. (Required)
 @return Returns a struct. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, June 7, 2011 
--->
<cffunction name="getTwitterUser" output="false" returnType="struct">
	<cfargument name="screenname" type="string" required="true">
	<cfset var httpResult = "">
	
	<!--- remove the @ if they included it. --->
	<cfif left(arguments.screenname,1) is "@">
		<cfset arguments.screenname = right(arguments.screenname, len(arguments.screenname)-1)>
	</cfif>
	
	<cfset var theUrl = "http://api.twitter.com/1/users/show.json?screen_name=#arguments.screenname#">
	
	<cfhttp url="#theUrl#" result="httpResult">
	<cfset var result = deserializeJSON(httpResult.filecontent)>
	
	<cfif structKeyExists(result, "error")>
		<cfset result.success = false>
	<cfelse>
		<cfset result.success = true>
	</cfif>

	<cfreturn result>	
</cffunction>