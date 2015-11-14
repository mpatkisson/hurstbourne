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
 Force recompiling of a page in the cfclasses cached folder.
 
 @param cachedFile 	 Filename, or partial filename. (Required)
 @return Returns a boolean. 
 @author Nathan Strutz (mrnate@hotmail.com) 
 @version 1, May 13, 2003 
--->
<cffunction name="DeleteCFCache" output="false" returntype="boolean">
	<cfargument name="cachedFile" required="Yes" type="string">
	
	<cfset var qryDir = "">

	<!--- cfcache puts url encoding on files, lowercases them and removes percent signs --->
	<cfset arguments.cachedFile = URLEncodedFormat(arguments.cachedFile)>
	<cfif reFindNoCase("%2[A-Z]",arguments.cachedFile)>
		<cfset arguments.cachedFile = Replace(REReplace(arguments.cachedFile,"%2[A-Z]{1,1}",LCase(Mid(arguments.cachedFile,REFind("%2[A-Z]{1,1}",arguments.cachedFile),3)),"ALL"),"%","","ALL")>
	</cfif>
	
	<cfdirectory action="LIST" directory="#server.coldfusion.rootdir#\wwwroot\WEB-INF\cfclasses\" name="qryDir">
	<cfquery name="qryDir" dbtype="query">
		SELECT name
		FROM qryDir
		WHERE name like '%#arguments.cachedFile#%'
	</cfquery>
	<cfif not qryDir.recordcount>
		<cfreturn false>
	</cfif>
	<cfloop query="qryDir">
		<cffile action="DELETE" file="#server.coldfusion.rootdir#\wwwroot\WEB-INF\cfclasses\#qryDir.name#">
	</cfloop>
	<cfreturn true>
</cffunction>