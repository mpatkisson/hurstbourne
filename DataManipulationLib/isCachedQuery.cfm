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
 Return true if the queryname passed was a cached query.
 
 @param queryname 	 Name of query to check. (Required)
 @return Returns a boolean. 
 @author Qasim Rasheed (qasimrasheed@hotmail.com) 
 @version 1, February 11, 2005 
--->
<cffunction name="isCachedQuery" returntype="boolean" output="false">
	<cfargument name="queryname" required="true" type="string" />
	
	<cfset var events = "">
	<cfset var result = false>	
	<cfset var temp = "">
	
	<cfif isdebugmode()>
		<cfset events = createobject('java','coldfusion.server.ServiceFactory').getDebuggingService().getDebugger().getData()>
		<cfquery name="temp" dbtype="query">
			select	cachedquery
			from	events
			WHERE 	type='SqlQuery' 
					and name='#arguments.queryname#'
		</cfquery>
		<cfset result = yesnoformat(temp.cachedquery)>
	</cfif>

	<cfreturn result />
</cffunction>