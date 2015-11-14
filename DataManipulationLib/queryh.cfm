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
 Returns a query with any string values sanitized by HTMLEditFormat.
 v2 modified by Raymond Camden
 
 @param query 	 Query to modify. (Required)
 @return Returns a query. 
 @author Kalyan Dhar (kalyan.cse.jis@gmail.com) 
 @version 2, May 1, 2011 
--->
<cffunction name="queryh" returnType="query" description="returns query after senitize descriptive fields">
	<cfargument name="query" type="query" required="true">

	<cfset var list = "" />
	<cfset var listSelect = "varchar,char,nvarchar,text,ntext" />
	<cfset var column = "">
	<cfset var metadata = "">
	<cfset var type = "">
	
	<cfloop list="#query.ColumnList#" index="column">
		<cfscript>
		metadata = query.getMetaData();
		type = metadata.getColumnTypeName(query.findColumn(column));
		</cfscript>

		<cfif listFindNoCase(listSelect,type)>
			<cfset list = listAppend(list,column)>
		</cfif>
	</cfloop>
	
	<cfif listLen(list)>
		<cfloop query="query">
			<cfloop list="#list#" index="column">
				<cfset querySetCell(query, column, htmlEditFormat(query[column][currentRow]),currentRow)>
			</cfloop>
		</cfloop>
	</cfif>

	<cfreturn query />
</cffunction>