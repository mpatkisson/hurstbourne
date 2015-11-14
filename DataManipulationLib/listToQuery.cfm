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
 Converts a list to a single-column query.
 
 @param list 	 List of items. (Required)
 @param delimiters 	 List delimiters. Defaults to a comma. (Optional)
 @param column_name 	 Name to use for column. Defaults to column. (Optional)
 @return Returns a query. 
 @author Russ Spivey (russellspivey@gmail.com) 
 @version 0, September 9, 2009 
--->
<cffunction name="listToQuery" access="public" returntype="query" output="false" 
	hint="Converts a list to a single-column query.">
    <cfargument name="list" type="string" required="yes" hint="List to convert.">
    <cfargument name="delimiters" type="string" required="no" default="," hint="Things that separate list elements.">
    <cfargument name="column_name" type="string" required="no" default="column" hint="Name to give query column.">
    
    <cfset var query = queryNew(arguments.column_name)>
    <cfset var index = ''>
    
    <cfloop list="#arguments.list#" index="index" delimiters="#arguments.delimiters#">
        <cfset queryAddRow(query)>
        <cfset querySetCell(query,arguments.column_name,index)>
    </cfloop>
    
    <cfreturn query>
</cffunction>