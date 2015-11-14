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
 Pings a TrackBack URL.
 
 @param trackbackurl 	 The TrackBack ping URL to ping (Required)
 @param permalink 	 The permalink for the entry (Required)
 @param charset 	 Default to utf-8. (Optional)
 @param title 	 The title of the entry (Optional)
 @param excerpt 	 An excerpt of the entry (Optional)
 @param blogName 	 The name of the weblog to which the entry was posted (Optional)
 @param timeout 	 Default to 30. Value, in seconds, that is the maximum time the request can take (Optional)
 @return Returns a string. 
 @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 @version 1, January 12, 2006 
--->
<cffunction name="pingTrackback" output="false" returntype="string">
	<cfargument name="trackBackURL" type="string" required="yes">
	<cfargument name="permalink" type="string" required="yes">
	<cfargument name="charset" type="string" required="no" default="utf-8">
	<cfargument name="title" type="string" required="no">
	<cfargument name="excerpt" type="string" required="no">
	<cfargument name="blogName"  type="string" required="no">
	<cfargument name="timeout"  type="numeric" required="no" default="30">
	<cfset var cfhttp = "">
	<cfhttp url="#arguments.trackBackURL#" method="post" timeout="#arguments.timeout#" charset="#arguments.charset#">
		<cfhttpparam type="header" name="Content-Type" value="application/x-www-form-urlencoded; charset=#arguments.charset#">
		<cfhttpparam type="formfield" encoded="yes" name="url" value="#arguments.permalink#">
		<cfif structKeyExists(arguments, "title")>
			<cfhttpparam type="formfield" encoded="yes" name="title" value="#arguments.title#">
		</cfif>
		<cfif structKeyExists(arguments, "excerpt")>
			<cfhttpparam type="formfield" encoded="yes" name="excerpt" value="#arguments.excerpt#">
		</cfif>
		<cfif structKeyExists(arguments, "blogName")>
			<cfhttpparam type="formfield" encoded="yes" name="blog_name" value="#arguments.blogName#">
		</cfif>
	</cfhttp>
	<cfreturn cfhttp.FileContent>
</cffunction>