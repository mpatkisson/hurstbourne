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
 Mimics the cfexecute tag.
 Updated for CFMX var scope.
 
 @param name 	 Program to execute. (Required)
 @param args 	 Args to pass. Can be string or array. (Optional)
 @param timeout 	 Time to wait for program execution. (Optional)
 @param outputFile 	 File to save results. (Optional)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 16, 2002 
--->
<cffunction name="execute" output="false" returnType="string">
	<cfargument name="name" type="string" required="true">
	<cfargument name="args" type="any" required="false" default="">
	<cfargument name="timeout" type="string" required="false" default="0">
	<cfargument name="outputfile" type="string" required="false" default="">

	<cfset var result = "">
	
	<cfsavecontent variable="result">
		<cfif len(outputFile)>
			<cfexecute name="#name#" arguments="#args#" timeout="#timeout#" outputfile="#outputfile#"/>
		<cfelse>
			<cfexecute name="#name#" arguments="#args#" timeout="#timeout#"/>
		</cfif>
	</cfsavecontent>
	<cfreturn result>
</cffunction>