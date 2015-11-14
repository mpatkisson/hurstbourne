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
 Transpose a query.
 
 @param inputQuery 	 The query to transpose. (Required)
 @param includeHeaders 	 Determines if headers should be included as a column. Defaults to true. (Optional)
 @return Returns a query. 
 @author Glenn Buteau (glenn.buteau@rogers.com) 
 @version 1, August 24, 2005 
--->
<cffunction name="queryTranspose" returntype="query">
	<cfargument name="inputQuery" type="query" required="true">
	<cfargument name="includeHeaders" type="boolean" default="true" required="false">
		
	<cfset var outputQuery = QueryNew("")>
	<cfset var columnsList = inputQuery.ColumnList>
	<cfset var newColumn = ArrayNew(1)>
	<cfset var row = 1>
	<cfset var zeroString = "000000">
	<cfset var padFactor = int(log10(inputQuery.recordcount)) + 1 >
	<cfset var i = "">
		
	<cfif includeHeaders>
		<cfset queryAddColumn(OutputQuery,"col_#right(zeroString & row, padFactor)#",listToArray(ColumnsList))>
		<cfset row = row + 1>
	</cfif>	

	<cfloop query="inputQuery">
		<cfloop index="i" from="1" to="#listlen(columnsList)#">
			<cfset newColumn[i] = inputQuery[ListGetAt(columnsList, i)][currentRow]>
		</cfloop>
		<cfset queryAddColumn(outputQuery,"col_#right(zeroString & row, padFactor)#",newColumn)>
		<cfset row = row + 1>
	</cfloop>
	
	<cfreturn outputQuery>
</cffunction>