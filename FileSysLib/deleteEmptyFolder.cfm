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
 Delete empty folder from given path.
 
 @param path 	 Path to delete (if empty). (Required)
 @return Returns a boolean. 
 @author Pritesh (pritesh@thecfguy.com) 
 @version 1, May 30, 2011 
--->
<cffunction name="deleteEmptyFolder" access="public" output="false" returntype="boolean">
	<cfargument name="path" required="true" type="string" />
	<cfset var qList="">
	<cfset var qDir = "">
	<cfset var qFiles = "">
	<cfset var isEmpty = 1>
	<!--- List Directory --->
	<cfdirectory action="list" directory="#arguments.path#" recurse="no" name="qList">
	<!--- get sub directory list --->
	<cfquery name="qDir" dbtype="query">
		select * from qList where type='Dir'
	</cfquery>
	<!--- Call recursive function to check directory empty or not --->
	<cfloop query="qDir">
		<!--- If sub directory not empty mark current directory as not empty. --->
		<cfif not deleteEmptyFolder(qDir.directory & "\" & qDir.name)>
			<cfset isEmpty=0>
		</cfif>
	</cfloop>

	<!--- Check for file exists in current directory --->
	<cfquery name="qFiles" dbtype="query">
		select * from qList where type='File'
	</cfquery>
	<!--- If file exists mark as not empty --->
	<cfif qFiles.recordCount gt 0>
		<cfset isEmpty = 0>
	</cfif>

	<!--- If current directory empty then delete it --->
	<cfif isEmpty>
		<cfdirectory action="delete" recurse="false" directory="#arguments.path#">
	</cfif>
	<!--- Return empty status for current directory --->
	<cfreturn isEmpty>
</cffunction>