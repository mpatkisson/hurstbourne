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
 Pass in file path to web root and a file and it returns URL relative to site root.
 
 @param webRootPath 	 Full path of the web root. (Required)
 @param filePath 	 Full path of the file to which a relative path is needed. (Required)
 @param encodeURL 	 Boolean value to encode the result. Defaults to false. (Optional)
 @return Returns a string. 
 @author Mike Gillespie (spidre@gmail.com) 
 @version 1, June 23, 2010 
--->
<cffunction name="getUrlRelativeToWebRoot" access="public" output="true" returntype="string" hint="pass in a web root and file path and get the url relative to the web root">
	<cfargument name="webRootPath" required="yes" type="string" hint="c:\wwwroot\ as an example">
	<cfargument name="filePath" required="yes" type="string" hint="c:\wwwroot\images\my image.gif">
	<cfargument name="encodeURL" required="no" type="boolean" default="false" hint="url encodes all between the slashes and ignores periods">
	<cfset var pathOut="">
	<!--- these two vars only needed if encodeURL is true --->
	<cfset var strPathOut="/">
	<cfset var arrPath=arraynew(1)>
	<cfset var x = "">

	<!--- strip out the web root path and convert the slashes --->
	<cfset pathOut=replace(replacenocase(arguments.filePath,arguments.webRootPath,"/","one"),"\","/","all")>
	<!--- made this an option since URLEncodedFormat() changes everything, including the slashes --->
	<cfif arguments.encodeURL>
		<!--- load the array --->
		<cfset arrPath=listtoarray(pathout,"/")>
		<!--- loop the array (old school for portability) --->
		<cfloop index="x" from="1" to="#arraylen(arrPath)#">
			<!--- encode the string, but change the periods back (personal preference) --->
			<cfset strPathOut=listAppend(strPathOut,replacenocase(urlencodedformat(arrPath[x]),"%2e",".","all"),"/")>
		</cfloop>
		<!--- re-populate the out var --->
		<cfset pathout=strPathOut>
	</cfif>
	<!--- lets make sure we have not duped any slashes to catch listAppend() and/or inconsistent data coming in --->
	<cfset pathout=replacenocase(pathOut,"//","/","all")>
	<cfreturn pathOut>
</cffunction>