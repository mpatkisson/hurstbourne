<cfcomponent output="false">

	<cfset variables._cfcDir = "NetLib">
	<cfset variables._udfdir = GetDirectoryFromPath(GetCurrentTemplatePath()) & variables._cfcDir>
	<cfset variables._q = "">

	<cffunction name="init" access="public" returntype="Any" output="false">
		<cfreturn this>
	</cffunction>

	<cfdirectory action="list" directory="#variables._udfdir#" filter="*.cfm" name="variables._q">

	<cfoutput query="variables._q">
		<cfinclude template="#variables._cfcDir#\#name#">
	</cfoutput>

</cfcomponent>