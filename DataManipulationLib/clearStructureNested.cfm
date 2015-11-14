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
 This function recurse through a structure and makes all fields as empty string
 
 @param s 	 Structure to clear. (Required)
 @return Returns a structure. 
 @author Qasim Rasheed (qasimrasheed@hotmail.com) 
 @version 1, January 28, 2005 
--->
<cffunction name="clearStructureNested" returntype="void" output="false">
	<cfargument name="s" type="struct" required="true" />
	<cfset var i = "">
	<cfloop collection="#arguments.s#" item="i">
		<cfif isstruct(arguments.s[i])>
			<cfset clearStructureNested(arguments.s[i])>
		<cfelse>
			<cfset structupdate(arguments.s, i,"")>
		</cfif>
	</cfloop>
</cffunction>