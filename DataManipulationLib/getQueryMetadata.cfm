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
 Replicates the CF7 getMetadata(query) functionality for MX6.1+
 
 @param Query 	 ColdFusion query object to return metadata for (Required)
 @return Returns an array 
 @author Marc Esher (marc.esher@gmail.com) 
 @version 0, May 30, 2010 
--->
<cffunction name="getQueryMetadata" access="public" returntype="array" hint="Replicates the CF7 getMetadata(query) functionality for MX6.1+">
		<cfargument name="query" type="query" required="true"/>
		<cfset var metadata = ArrayNew(1)>
		<cfset var columns = ArrayNew(1)>
		<cfset var col = 1>
		<cfset var map = StructNew()>
		<cfif listFirst(server.ColdFusion.ProductVersion) GT 6>
			<cfreturn getMetadata(arguments.query)>
		</cfif>
		
		<cfset columns = arguments.query.getMetaData().getColumnLabels() />
		
		<cfloop from="1" to="#ArrayLen(columns)#" index="col">
			<cfset map = StructNew()>
			<cfset map.name = columns[col]>
			<cfset map.IsCaseSensitive = arguments.query.getMetaData().isCaseSensitive( javacast("int",col))>
			<cfset map.TypeName = arguments.query.getMetadata().getColumnTypeName(javacast("int",col))>
			<cfset ArrayAppend(metadata,map)>
		</cfloop>
		
		<cfreturn metadata>
	</cffunction>