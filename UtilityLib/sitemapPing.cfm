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
 Ping multiple search engines with your sitemap.xml file and get the server response.
 
 @param service 	 A comma delimited string with search engine names. (Required)
 @param urltosubmit 	 A fully qualified URL to submit to search engines. (Required)
 @param feedback 	 The response to a submitted url by a specified server. (Optional)
 @param fbtype 	 The desired format of the returned response: XML or an array of structures. (Optional)
 @return An (optional) XML fragment OR array of structs with the response from the pinged server(s). 
 @author Frank Marion (mail@frankmarion.com) 
 @version 1, August 26, 2010 
--->
<cffunction name="sitemapPing" displayname="sitemapPing" access="public" output="false" returntype="Any" hint="Ping search engine services with sitemap location">

	<!--- Arg! --->
	<cfargument name="service" 		type="string" required="true" 	hint="A comma delimited string with search engine names.">
	<cfargument name="urltosubmit" 	type="string" required="true" 	hint="A fully qualified URL to submit to search engines.">
	<cfargument name="feedback" 	type="string" required="false" 	hint="The response to a submitted url by a specified server.">
	<cfargument name="fbtype" 		type="string" required="false" 	hint="The desired format of the returned response: XML or an array of structures.">

	<!--- Locals --->
	<cfset var serverList = {
		  ask = 		"http://submissions.ask.com/ping?sitemap="
		, bing = 		"http://www.bing.com/webmaster/ping.aspx?siteMap="
		, gblogsearch = "http://blogsearch.google.com/ping?URL="
		, google =		"http://www.google.com/webmasters/tools/ping?sitemap="
		, msn = 		"http://api.moreover.com/ping?u="
		, technocrati = "http://technorati.com/ping/?url="
		, yahoo =		"http://search.yahooapis.com/SiteExplorerService/V1/updateNotification?appid=SitemapWriter&url="
	} />
	<cfset var accessURL = "">
	<cfset var serverResponseAsArray = ArrayNew(1)>
	<cfset var xmlRespHead = '<?xml version="1.0" encoding="UTF-8"?><sitemapPingResponse>'>
	<cfset var xmlServResp = ''>
	<cfset var xmlRespFoot = '</sitemapPingResponse>'>

	<!--- For convenience --->
	<cfset var selectedService = Trim(arguments.service)>

	<!--- Did we choose "all"? --->
	<cfif selectedService EQ "all">
		<cfset selectedService = StructKeyList(serverList)>
	</cfif>

	<!--- Loop over the collection of services --->
	<cfloop collection="#serverList#" item="key">

		<!--- If we haz a match --->
		<cfif ListContainsNoCase(selectedService, key, ",")>

			<!--- Build the url and access it --->
			<cfset  accessURL = "#serverList[key]##Trim(arguments.urltosubmit)#">
			<cfhttp url="#accessURL#" method="get" throwonerror="false">

			<!--- Create a struct with the response from each server for later feedback --->
			<cfset serverResponseStruct = {
				  serverName	= key
				, statusCode	= cfhttp.StatusCode
				, errorDetail	= XMLFormat(cfhttp.errorDetail)
				, submittedUrl	= XMLFormat(accessURL)
			}>

			<!--- Add the response-in-struct to the reponse array for later feedback --->
			<cfset ArrayAppend(serverResponseAsArray,serverResponseStruct)>

			<!--- Create the xml fragment for later feedback --->
			<cfsavecontent variable="xmlFrag"><cfoutput>
				<server>
					<serverName>#serverResponseStruct.serverName#</serverName>
					<statusCode>#serverResponseStruct.statusCode#</statusCode>
					<errorDetail>#serverResponseStruct.errorDetail#</errorDetail>
					<submittedUrl>#serverResponseStruct.submittedUrl#</submittedUrl>
				</server>
			</cfoutput></cfsavecontent>
			<cfset xmlServResp = xmlServResp & xmlFrag>

		</cfif>

	</cfloop>

	<!--- Build the final XML response result (and trim the whitespace between tags) --->
	<cfset serverResponseAsXML = REReplaceNoCase(xmlRespHead & xmlServResp & xmlRespFoot,"[\t\r\n]+", "" ,"all")>

	<!--- Did we ask for a response? --->
	<cfif structKeyExists(arguments, "feedback")>
		<cfif structKeyExists(arguments, "fbtype") AND arguments.fbtype EQ "array">
			<cfreturn serverResponseAsArray />
		<cfelse>
			<cfreturn serverResponseAsXML />
		</cfif>
	<cfelse>
		<cfreturn true />
	</cfif>

</cffunction>