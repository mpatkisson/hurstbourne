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
 This function will remove any reserved characters from a filename string and replace any spaces with underscores.
 
 @param filename 	 Filename. (Required)
 @return Returns a string. 
 @author Jason Sheedy (jason@jmpj.net) 
 @version 1, January 19, 2006 
--->
<cffunction name="filterFilename" access="public" returntype="string" output="false" hint="I remove any special characters from a filename and replace any spaces with underscores.">
	<cfargument name="filename" type="string" required="true" />
	<cfset var filenameRE = "[" & "'" & '"' & "##" & "/\\%&`@~!,:;=<>\+\*\?\[\]\^\$\(\)\{\}\|]" />
	<cfset var newfilename = reReplace(arguments.filename,filenameRE,"","all") />
	<cfset newfilename = replace(newfilename," ","_","all") />
	
	<cfreturn newfilename /> 
</cffunction>