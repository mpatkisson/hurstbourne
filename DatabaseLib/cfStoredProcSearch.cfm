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
 Search SQL Server Stored Procedures for a value.
 
 @param datasource 	 Database to search. (Required)
 @param searchstring 	 Name to search for. (Required)
 @return Returns a query of stored procedure names that match. 
 @author Jose Diaz (bleachedbug@gmail.com) 
 @version 1, November 14, 2007 
--->
<cffunction name="cfStoredProcSearch" access="public" returntype="query" output=false>

	<cfargument name="datasource" type="string" required="true"/>
	<cfargument name="searchString" type="string" required="true"/>
	<cfset var qStoredProcSearch = "">

	<cfquery name="qStoredProcSearch" datasource="#arguments.datasource#">
		select name
		from sysobjects s
		   , syscomments c
		where s.id = c.id and text like '%#arguments.searchString#%'
	</cfquery>


	<cfreturn qStoredProcSearch />

</cffunction>