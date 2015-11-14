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
 Adds a row to a query object and populates it with the values of a structure.
 
 @param query 	 the query to which the struct should be added as a row to (Required)
 @param struct 	 the struct that will be added to the query as a query row (Required)
 @return returns the query with the added row 
 @author Brian Rinaldi (brian.rinaldi@gmail.com) 
 @version 1, April 25, 2008 
--->
<cffunction name="structToQueryRow" output="false" access="public" returntype="query">
	<cfargument name="query" required="true" type="query" />
	<cfargument name="struct" required="true" type="struct" />
	<cfset var item = "" />
	<cfset var returnQ = arguments.query />

	<cfset queryAddRow(arguments.query) />
	
	<cfloop collection="#arguments.struct#" item="item">
		<cfif listFindNoCase(returnQ.columnList,item)>
			<cfset querySetCell(returnQ,item,arguments.struct[item]) />
		</cfif>
	</cfloop>
	
	<cfreturn returnQ />
</cffunction>