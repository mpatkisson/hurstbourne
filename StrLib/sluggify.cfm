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
 Converts a string into a pretty URL safe slug
 
 @param str 	 String to modify. (Required)
 @param spacer 	 Character used for spaces. Defaults to -. (Optional)
 @return Returns a string. 
 @author Michael Haggerty (mike@mikehaggerty.net) 
 @version 1, June 11, 2009 
--->
<cffunction name="sluggify" output="false" returnType="string">
	<cfargument name="str">
	<cfargument name="spacer" default="-">
	
	<cfset var ret = "" />
	
	<cfset str = lCase(trim(str)) />
	<cfset str = reReplace(str, "[^a-z0-9-]", "#spacer#", "all") />
	<cfset ret = reReplace(str, "#spacer#+", "#spacer#", "all") />
	
	<cfif left(ret, 1) eq "#spacer#">
		<cfset ret = right(ret, len(ret)-1) />
	</cfif>
	<cfif right(ret, 1) eq "#spacer#">
		<cfset ret = left(ret, len(ret)-1) />
	</cfif>
	
	<cfreturn ret />
</cffunction>