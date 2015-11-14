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
 Simple table-based datadump from any query
 
 @param queryData 	 Query to display. (Required)
 @return Returns a string. 
 @author Jared Rypka-Hauer (jared@web-relevant.com) 
 @version 2, June 9, 2011 
--->
<cffunction name="queryToTableDump" access="public" returntype="string" output="false">
	<cfargument name="queryData" type="query" required="true" />
	<cfset var theQuery = arguments.queryData>
	<cfset var columns = arraytolist(theQuery.getMeta().getColumnLabels())>
	<cfset var theResults = "">
	<cfset var c = "">
	<cfset var i = "">
	<cfsavecontent variable="theResults">
		<cfoutput>
			<table border="1" cellpadding="0" cellspacing="0" align="left">
			<tr>
			<cfloop list="#columns#" index="c">
				<th>#c#</th>
			</cfloop>
			</tr>
			<cfloop from="1" to="#theQuery.recordCount#" index="i">
				<tr><cfloop list="#columns#" index="c">
					<td><cfif len(theQuery[c][i])>#theQuery[c][i]#<cfelse> </cfif></td></cfloop>
				</tr>
			</cfloop>
			</table>
		</cfoutput>
	</cfsavecontent>
	<cfreturn theResults />
</cffunction>