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
 Gets the configuration of an existing datasource.
 
 @param dsn 	 The name of the datasource. (Required)
 @return Returns a structure. 
 @author Martin Parry (martin.parry@beetrootstreet.com) 
 @version 1, January 6, 2004 
--->
<cffunction name="getdsn" returntype="struct" output="false">
	<cfargument name="dsn" type="string" required="yes">

	<!--- initialize variables --->
	<cfset var dsservice = "">

	<!--- get "factory" --->
	<cfobject action="create"
	         type="java"
	         class="coldfusion.server.ServiceFactory"
	         name="factory">

	<!--- get datasource service --->
	<cfset dsservice = factory.getdatasourceservice()>

	<cfif not structKeyExists(dsservice.datasources,dsn)>
		<cfthrow message="#dsn# is not a registered datasource.">
	</cfif>
	
	<!--- get dsn --->
	<cfreturn duplicate(dsservice.datasources[dsn])>

</cffunction>