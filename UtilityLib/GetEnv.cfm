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
 Returns environment information. (Windows only!)
 
 @param varName 	 Environment variable to return. (Optional)
 @return Returns either a structure or a string. 
 @author Ben Forta (ben@forta.com) 
 @version 1, March 11, 2003 
--->
<cffunction name="GetEnv" output="false" returnType="any">
	<cfargument name="varname" type="string" required="no">
	
	<!--- Define local variables --->
	<cfset var env=structNew()>
	<cfset var data="">
	<cfset var ename="">
	<cfset var evalue="">
	<cfset var i = 1>
	
	<!--- Get enviroment and save to variable --->
	<cfsavecontent variable="data">
		<cfexecute name="cmd /c set" timeout="1" />
	</cfsavecontent>

	<!--- Need to convert to structure, so loop through --->
	<cfloop index="i" list="#trim(data)#" delimiters="#chr(10)##chr(13)#">
		<!--- For each line, get name and value --->
		<cfset ename=trim(listfirst(i, "="))>
		<cfset evalue=trim(listrest(i, "="))>
		<!--- And add to structure --->
		<cfset env[ename] = evalue>
	</CFLOOP>

	<!--- And finally, build return value --->
	<cfif not isDefined("varname")>
		<!--- If no name, return list --->
		<cfreturn env>
	<cfelseif structKeyExists(env, varname)>
		<!--- If name provided, and present, get value --->
		<cfreturn env[varname]>
	</cfif>

</cffunction>