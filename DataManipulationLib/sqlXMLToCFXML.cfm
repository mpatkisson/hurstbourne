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
 Converts a query of XML generated by MSSQL to readable XML string.
 
 @param doc 	 Name for root level element. (Required)
 @param qry 	 Query to convert. (Required)
 @return Returns a string. 
 @author Russel Brown (russel.brown@universalmind.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="sqlXMLToCFXML" access="public" output="false" returntype="Any" hint="This function will take a multiple row query result and turn it into a CF XML var.">
      <cfargument name="doc" type="String" required="false" default="xml" />
      <cfargument name="qry" type="Query" required="true" />

      <cfset var x = "" />
      <cfset var y = "" />
      <cfset var retXML = "" />

      <cfset x = listFirst(arguments.qry.columnList)>
      <cfloop index="y" from="1" to="#arguments.qry.recordCount#">
         <cfset retXML = retXML & arguments.qry[x][y]>
      </cfloop>

      <cfset retXML = "<#arguments.doc#>" & retXML & "</#arguments.doc#>">

      <cfreturn retXML>
</cffunction>