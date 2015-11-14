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
 Change query order from horizontal to vertical to display in a HTML table
 
 @param theQuery 	 cfquery object to "rotate" (Required)
 @param tableCols 	 Number of columns to output (Optional)
 @return Returns a query. 
 @author Jose Alberto Guerra (cheveguerra@gmail.com) 
 @version 0, March 6, 2010 
--->
<cffunction name="qryOrderToTable" returntype="query" hint="Changes horizontal order to vertical in a query to display in a HTML table" output="no">
	<cfargument name="theQuery" type="query" required="yes">
	<cfargument name="tableCols" type="numeric" default="2">
	<cfset var change=ceiling(theQuery.recordCount/tableCols)>
	<cfset var column=0>
	<cfset var newQry=QueryNew("#theQuery.columnList#")>
	<cfset var temp = QueryAddRow(newQry, theQuery.recordCount)>
	<cfset var thisRow=0>
	<cfset var c=0>
	<cfset var newPos=0>
	<cfset var thisCol=0>

	<cfoutput query="theQuery">
		<cfset thisRow=currentRow>
		<cfloop index="c" from="1" to="#tableCols#">
			<cfif currentRow gt (change*c)><cfset column=c><cfset thisRow=currentRow-(change*c)></cfif>
		</cfloop>
		<cfset newPos=thisRow+column+((thisRow-1)*(tableCols-1))>
		<cfloop index="thisCol" list="#theQuery.columnList#">
			<cfset temp = QuerySetCell(newQry, thisCol, evaluate(thisCol), newPos)>
		</cfloop>
	</cfoutput>
	<cfreturn newQry>
</cffunction>