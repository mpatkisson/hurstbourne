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
 Export table data in script format (INSERT statements).
 Modified by Raymond
 v2 by Joseph Flanigan (joseph@switch-box.org)
 
 @param table 	 Table to export. (Required)
 @param dbsource 	 DSN. (Required)
 @param dbuser 	 Database username. (Optional)
 @param dbpassword 	 Database password. (Optional)
 @param commitAfter 	 Inserts commit statements after a certain number of rows. Defaults to 100. (Optional)
 @return Returns a string. 
 @author Asif Rashid (asifrasheed@rocketmail.com) 
 @version 2, April 18, 2006 
--->
<cffunction name="exportSQLTable" returnType="string" output="false">
        <cfargument name="table" type="string" required="true">
        <cfargument name="dbsource" type="string" required="true">
        <cfargument name="dbuser" type="string" required="false" default="">
        <cfargument name="dbpassword" type="string" required="false" default="">
        <cfargument name="commitAfter" default="100" type="numeric">

        <cfset var i = 1>
        <cfset var j = 1>
        <cfset var k = 0>
        <cfset var temp = "">
        <cfset var qryTemp = "">
        <cfset var tempCol = "">
        <cfset var str = "">
        <cfset var textstr = "">

        <!--- Getting table data --->
        <cfquery name="qryTemp" datasource="#arguments.dbsource#" username= "#arguments.dbuser#" password="#arguments.dbpassword#">
                select * from #arguments.table#
        </cfquery>

        <!--- Getting meta information of executed query --->
        <cfset tempCol = getMetaData(qryTemp)>
        <cfset k =      ArrayLen(tempCol) >

        <cfloop query="qryTemp">
                <cfset temp = "INSERT INTO " & arguments.table &" (">
                <cfloop index="j" from="1" to="#k#">
                        <cfset temp = temp & "[#tempCol[j].Name#]" >
                 <cfif j NEQ k >
                        <cfset temp = temp & "," >
                 </cfif>
                </cfloop>


                <cfset temp = temp & ") VALUES (">
                <cfloop index="j" from="1" to="#k#">
                        <cfif FindNoCase("char", tempCol[j].TypeName)
                              OR FindNoCase("date", tempCol[j].TypeName)
                                  OR FindNoCase("text", tempCol[j].TypeName)
                                  OR FindNoCase("unique", tempCol[j].TypeName)
                                  OR FindNoCase("xml", tempCol[j].TypeName)
                                   >
                                <cfset textstr = qryTemp[tempCol[j].Name][i] >
                                <cfif Find("'",textstr)>
                                  <cfset textstr = Replace(textstr,"'","'","ALL") >
                                </cfif>
                                <cfset temp = temp & "'" & textstr & "'" >
                        <cfelseif FindNoCase("image",tempCol[j].TypeName)>
                                 <cfset temp = temp & "'" >
                        <cfelse>
                                <cfset temp = temp & qryTemp[#tempCol[j].Name#][i] >
                        </cfif>
                  <cfif j NEQ k >
                        <cfset temp = temp  &  "," >
                 </cfif>

                </cfloop>
                <cfset temp = temp & ");">
                <cfset str = str & temp & chr(10)>
                <cfif i mod commitAfter EQ 0>
                        <cfset str = str & "commit;" & chr(10)>
                </cfif>
                <cfset i = i + 1>
        </cfloop>
        <cfreturn str>
</cffunction>