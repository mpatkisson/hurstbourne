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
 Remove a list of columns from a specified query.
 
 @param theQuery 	 The query to manipulate. (Required)
 @param columnsToRemove 	 A list of columns to remove. (Required)
 @return Returns a query. 
 @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 @version 1, April 14, 2005 
--->
<cffunction name="queryRemoveColumns" output="false" returntype="query">
	<cfargument name="theQuery" type="query" required="yes">
	<cfargument name="columnsToRemove" type="string" required="yes">
	<cfset var columnList=theQuery.columnList>
	<cfset var columnPosition="">
	<cfset var c="">
	<cfset var newQuery="">
	<cfloop list="#arguments.columnsToRemove#" index="c">
		<cfset columnPosition=ListFindNoCase(columnList,c)>
		<cfif columnPosition NEQ 0>
			<cfset columnList=ListDeleteAt(columnList,columnPosition)>
		</cfif>
	</cfloop>
	<cfquery name="newQuery" dbtype="query">
		SELECT #columnList# FROM theQuery
	</cfquery>
	<cfreturn newQuery>
</cffunction>