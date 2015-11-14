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
 Sorts a query using Query of Query.
 Updated for CFMX var syntax.
 
 @param query 	 The query to sort. (Required)
 @param column 	 The column to sort on. (Required)
 @param sortDir  	 The direction of the sort. Default is "ASC." (Optional)
 @return Returns a query. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, October 15, 2002 
--->
<cffunction name="QuerySort" output="no" returnType="query">
	<cfargument name="query" type="query" required="true">
	<cfargument name="column" type="string" required="true">
	<cfargument name="sortDir" type="string" required="false" default="asc">

	<cfset var newQuery = "">
	
	<cfquery name="newQuery" dbType="query">
		select * from query
		order by #column# #sortDir#
	</cfquery>
	
	<cfreturn newQuery>
	
</cffunction>