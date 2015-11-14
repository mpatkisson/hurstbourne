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
 Uses Google's URL Shortening service to shorten a URL.
 v2 by RJLSoftware (rjlsoftware@gmail.com)
 
 @param url 	 URL to shorten. (Required)
 @param apiKey 	 Optional API key. (Optional)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, January 14, 2011 
--->
<cffunction name="googleURLShorten" output="false" returnType="string">
	<cfargument name="url" type="string" required="true">
	<cfargument name="apiKey" type="string" required="false" default="" hint="API key identifies your application to Google">

	<cfset var requestURL = "https://www.googleapis.com/urlshortener/v1/url">
	<cfset var httpResult = "">
	<cfset var result = "">
	<cfset var response = "">
	<cfset var body = {"longUrl"=arguments.url}>
	<cfset body = serializeJson(body)>

	<cfif arguments.apiKey NEQ "">
	    <cfset requestURL=requestURL & "?key=" & arguments.apiKey>
	</cfif>

	<cfhttp url="#requestURL#" method="post" result="httpResult">
		<cfhttpparam type="header" name="Content-Type" value="application/json">
		<cfhttpparam type="body" value="#body#">
	</cfhttp>
	<cfset response=deserializeJSON(httpResult.filecontent.toString())>

    <cfif structkeyexists(response, 'error')>
        <cfset result=response.error.message>
    <cfelse>
        <!--- No Errors, return response.id (which is the shortened url) --->
        <cfset result=response.id>
    </cfif>

	<cfreturn result>
</cffunction>