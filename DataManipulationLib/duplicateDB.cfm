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
 Duplicates small to medium MySQL databases.
 
 @param datasource 	 DSN (Required)
 @param source 	 Source for duplication. (Required)
 @param target 	 Target for duplication. (Required)
 @param copyData 	 Boolean that determines if data along with structure. Defaults to false. (Optional)
 @return Returns nothing. 
 @author Steve Good (steve@stevegood.org) 
 @version 1, February 21, 2011 
--->
<cffunction name="duplicateDB" access="public" returntype="void" output="false" hint="I duplicate a MySQL database locally on the same server.">
	<cfargument name="datasource" type="string" required="true" />
	<cfargument name="source" type="string" required="true" />
	<cfargument name="target" type="string" required="true" />
	<cfargument name="copyData" type="boolean" required="false" default="false" />
	
	<cfquery datasource="#arguments.datasource#">
	CREATE DATABASE  IF NOT EXISTS #arguments.target#;
	</cfquery>
	
	<cfdbinfo datasource="#arguments.datasource#" name="local.tbls" type="tables" />
	
	<cfloop query="local.tbls">
		<cfquery datasource="#arguments.datasource#">
		CREATE TABLE #arguments.target#.#table_name# LIKE #arguments.source#.#table_name#;
		</cfquery>
		
		<cfif arguments.copydata>
			<cfquery datasource="#arguments.datasource#">
			INSERT INTO #arguments.target#.#table_name# SELECT * FROM #arguments.source#.#table_name#;
			</cfquery>
		</cfif>
	</cfloop>
</cffunction>