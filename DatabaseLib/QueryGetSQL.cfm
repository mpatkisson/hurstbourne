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
 Returns the SQL statement used to generate the specified query.
 
 @param queryname 	 Name of the query you wish to return the SQL statement for. (Required)
 @return Returns a string. 
 @author Ben Forta (ben@forta.com) 
 @version 1, October 15, 2002 
--->
<CFFUNCTION NAME="QueryGetSQL" RETURNTYPE="string">

	<!--- Query name is required --->
	<CFARGUMENT NAME="queryname" TYPE="string" REQUIRED="yes">

        <!--- Initialize variables --->
        <CFSET var cfdebugger="">
        <CFSET var events ="">
        
	<!--- Initialize result string --->
	<CFSET var result="">

	<!--- Requires debug mode --->
	<CFIF IsDebugMode()>

		<!--- Use debugging service --->
		<CFOBJECT ACTION="CREATE"
		          TYPE="JAVA"

CLASS="coldfusion.server.ServiceFactory"
				  NAME="factory">
		<CFSET cfdebugger=factory.getDebuggingService()>

		<!--- Load the debugging service's event table --->
		<CFSET events = cfdebugger.getDebugger().getData()>

		<!--- Get SQL statement (body) for specified query --->
		<CFQUERY DBTYPE="query" NAME="getquery" DEBUG="false">
		SELECT body
		FROM events
		WHERE type='SqlQuery' AND name='#queryname#'
		</CFQUERY>

		<!--- Save result --->
		<CFSET result=getquery.body>
	</CFIF>

	<!--- Return string --->
	<CFRETURN result>
</CFFUNCTION>