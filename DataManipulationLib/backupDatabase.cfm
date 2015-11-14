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
 Backs up a database to a zip file.
 
 @param dbsource 	 DNS. (Required)
 @return Returns a string. 
 @author Darwan Leonardo Sitepu (dlns2001@yahoo.com) 
 @version 1, February 21, 2011 
--->
<cffunction name="backupDatabase" returnType="string" output="false">
    <cfargument name="dbsource" type="string" required="true">
    <cftry>
        <cfdbinfo datasource="#arguments.dbsource#" name="tables" type="tables" />
        <cfsilent>
            <cfset data = StructNew() />
            <cfloop query="tables">  <!--- grab all data from table --->  
                <cftry>
                    <cfset data[Table_Name] = StructNew() />  
                    <cfdbinfo datasource="#datasource#" table="#Table_Name#" name="qryTableFields" type="columns" />  
                    <cfset data[Table_Name].schema = qryTableFields />  
                    <cfquery name="getData" datasource="#datasource#" debug="no" cachedwithin=#CreateTimeSpan(0,0,0,10)# >SELECT * FROM [#Table_Name#]</cfquery>    
                    <cfset data[Table_Name].data = getData />            
                <cfcatch></cfcatch>
                </cftry>
            </cfloop><!--- Now serialize into one ginormous string --->
        </cfsilent>
        <cfwddx action="cfml2wddx" input="#data#" output="packet" /><!--- file to store zip --->
        <cfset zfile = expandPath("./data.zip") /><!--- Now zip this baby up --->
        <cfzip action="zip" file="#zfile#" overwrite="true"><cfzipparam content="#packet#" entrypath="data.packet.xml" /></cfzip>
        <cfreturn "I retrieved #tables.recordCount# tables from datasource #datasource# and saved it to #zfile#.">
    <cfcatch>
    	<cfreturn "Backup Database Is Failed..">
    </cfcatch>
    </cftry>
</cffunction>