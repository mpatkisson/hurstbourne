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
 Adds a column filled with a value to a query object.
 V2 by Raymond Camden
 v3 by author
 
 @param query 	 Query to manipulate. (Required)
 @param column_name 	 Name of new column. (Required)
 @param value 	 Value to use. Defaults to nothing. (Optional)
 @return Returns a boolean. 
 @author Gabriele Bernuzzi (gabriele.bernuzzi@gruppotesi.com) 
 @version 3, December 13, 2005 
--->
<cffunction name="queryAddColumnWithValue" returntype="boolean" output="false">
	<cfargument name="query" type="query" required="true" />
	<cfargument name="column_name" type="string" required="true" />
	<cfargument name="value" type="string" required="false" default="" />
	<cfset var arr=arrayNew(1) />
	
	<cfscript>
		arraySet(arr,1,arguments.query.recordCount,arguments.value);
		queryAddColumn(arguments.query, arguments.column_name, arr);
	</cfscript>

	<cfreturn true>
</cffunction>