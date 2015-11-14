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
 Scans a directory (or path) for files of a specified extension and then copies them to the path you specify.
 v2 by Raymond Camden. I just cleaned up the var statements.
 
 @param extensions 	 List of extensions to copy. (Required)
 @param destinationPath 	 Destination directory. (Required)
 @param sourcePath 	 Source directory. (Required)
 @return Returns nothing. 
 @author Steven Ross (steven.ross@zerium.com) 
 @version 2, April 7, 2006 
--->
<cffunction name="collectFiles" access="public" hint="recurses through a directory and collects the file types you want then outputs to another directory" returnType="void">
	<cfargument name="extensions" required="true" type="string" hint="The extensions you want to gather up csv (list) format ex:(asp,cfm,jsp) ">
	<cfargument name="destinationPath" required="true" type="string" hint="absolute path to storage directory">
	<cfargument name="sourcePath" required="true" type="string" hint="absolute path to source directory">
	<cfset var root = arguments.sourcePath/>
	<cfset var i = "">
	<cfset var absPath = "">
	<cfset var relativePath = "">
	<cfset var writeTo = "">
	<cfset var pathAndFile = "">
	
	<cfif not directoryExists(arguments.sourcePath)>
		<cfthrow message="Source Directory (#arguments.sourcePath#) not found" detail="You didn't pass in a valid source directory, check the path and try again.">
	</cfif>
	
	<cfloop list="#arguments.extensions#" index="i">
		
		<cfdirectory name="getFiles" directory="#root#" recurse="true" filter="*.#i#">
	
			<cfloop query="getFiles">
				
				<cfset absPath = getFiles.directory & "/" />
				
				<cfset relativePath = Replace(absPath, root, "", "all") />
				
				<cfset writeTo = ARGUMENTS.destinationPath & "/" & relativePath>
				
				<cfset pathAndFile = getFiles.directory & "/" & getFiles.name />
				
				<cfif not directoryExists(writeTo)>
					<cfdirectory action="create" directory="#writeTo#">
					<cffile action="copy" source="#pathAndFile#" destination="#writeTo#">
				<cfelse>
					<cffile action="copy" source="#pathAndFile#" destination="#writeTo#">
				</cfif>
				
			</cfloop>
			
	</cfloop>

</cffunction>