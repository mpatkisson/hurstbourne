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
 Returns information about a file.
 Updated for CMFX var scope.
 
 @param fileName 	 File to inspect. (Required)
 @return Returns a query. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 15, 2002 
--->
<cffunction name="fileInfo" output="false" returntype="query">
	<cfargument name="fileName" type="string" required="true">

	<cfset var directory = "">
	<cfset var getFile = queryNew("")>
	
	<cfif not fileExists(fileName)>
		<cfthrow message="fileInfo error: #fileName# does not exist.">
	</cfif>
	<cfset directory = getDirectoryFromPath(fileName)>
	<cfdirectory name="getFile" directory="#directory#" filter="#getFileFromPath(fileName)#">
	<cfreturn getFile>
</cffunction>