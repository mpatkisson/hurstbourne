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
 Reverses a URL shortened by Google's URL Shortening service.
 
 @param url 	 Shortened URL to expand. (Required)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, January 13, 2011 
--->
<cffunction name="googleURLExpand" output="false" returnType="string">
	<cfargument name="url" type="string" required="true">
	<cfset var httpResult = "">
	<cfset var result = "">

	<cfhttp url="https://www.googleapis.com/urlshortener/v1/url?shortUrl=#urlEncodedFormat(arguments.url)#" method="get" result="httpResult"></cfhttp>

	<cfset result = httpResult.filecontent.toString()>
	<cfreturn deserializeJSON(result).longUrl>
</cffunction>