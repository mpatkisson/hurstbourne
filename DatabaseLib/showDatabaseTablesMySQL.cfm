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
 This function will return all child tables of a mySQL database as an array.
 
 @param Path 	 Path to where mysqlshow exists. (Required)
 @param Database 	 Database to inspect. (Required)
 @param Timeout 	 Time to wait for results. Defaults to 30. (Optional)
 @return Returns an array. 
 @author brandon wyckoff (bwyckoff2@cox.net) 
 @version 1, June 4, 2004 
--->
<cffunction name="showDatabaseTablesMySQL">
	<cfargument name="path" required="true">
	<cfargument name="database" required="true">
	<cfargument name="timeout" required="false" default="30">
	<cfscript>
		var a = "";
		var x = "";
		var y = 1;
		database=replace(database, '_', '\_', 'all');
	</cfscript>
	<cfexecute name="#arguments.path#\mysqlshow" arguments="#arguments.database#" timeout="#arguments.timeout#" variable="mySQLDB"></cfexecute>
	<cfscript>
		a=replaceList(mySQLDB,'+,-, ,','');
		a=trim(a);
		x=arrayNew(1);
	</cfscript>
	<cfloop list="#a#" index="i" delimiters="|">
		<cfscript>
			if (not compareNoCase(left(i, 9), "Database:")) {
					
			} else if (not compareNoCase(trim(replace(i, '|', '', 'all')),"Tables")) {
					x = arrayNew(1);
			} else if (compareNoCase(trim(i), "")) {
					x[y]=i;
					y=y+1;			
			}
		</cfscript>
	</cfloop>
	<cfreturn x>
</cffunction>