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
 Extracts the host name from a URL.
 
 @param url 	 the url from which you want to extract the host name (Optional)
 @return Returns a string containing the host name. 
 @author Todd Sharp (todd@cfsilence.com) 
 @version 1, June 5, 2008 
--->
<cffunction name="getHostFromURL" access="public" output="false" returntype="string">
	<cfargument name="url" required="false" default="" />
	<cfset var jURL = "" />
	<cfif len(arguments.url)>
		<cfset jURL = createObject("java", "java.net.URL").init(arguments.url) />
		<cfreturn jURL.getHost() />
	<cfelse>
		<cfreturn ""/>
	</cfif>
</cffunction>