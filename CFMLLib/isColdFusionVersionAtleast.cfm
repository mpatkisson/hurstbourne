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
 Checks the server's ColdFusion product version
 
 @param MinimumVersionNumber 	 Minimum ColdFusion version (Required)
 @return Returns a boolean. 
 @author Jon Hartmann (jon.hartmann@gmail.com) 
 @version 1, April 14, 2011 
--->
<cffunction name="isColdFusionVersionAtleast" access="private" output="false" returntype="boolean">
	<cfargument name="MinimumVersionNumber" type="string" required="true" />

	<cfset Local.VersionData = ListToArray(Server.ColdFusion.ProductVersion) />
	<cfset Local.TestVersionData = ListToArray(Arguments.MinimumVersionNumber) />
	<cfset Local.Result = true />
	<cfset local.x = "">
	
	<cfloop from="1" to="#Min(ArrayLen(Local.TestVersionData), ArrayLen(Local.VersionData))#" index="x">
		<cfif Local.VersionData[x] lt Local.TestVersionData[x]>
			<cfset Local.Result = false />
			<cfbreak />
		<cfelseif Local.VersionData[x] gt Local.TestVersionData[x]>
			<cfbreak />
		</cfif>
	</cfloop>

	<cfreturn Local.Result />
</cffunction>