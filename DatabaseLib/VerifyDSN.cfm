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
 Verifies a DSN is working.
 
 @param dsn 	 Name of a DSN you want to verify. (Required)
 @return Returns a Boolean. 
 @author Ben Forta (ben@forta.com) 
 @version 1, October 15, 2002 
--->
<CFFUNCTION NAME="VerifyDSN" RETURNTYPE="boolean">
   <CFARGUMENT NAME="dsn" TYPE="string" REQUIRED="yes">

   <!--- initialize variables --->
   <CFSET var dsService="">
   <!--- Try/catch block, throws errors if bad DSN --->
   <CFSET var result="true">


   <CFTRY>
      <!--- Get "factory" --->
      <CFOBJECT ACTION="CREATE"
                TYPE="JAVA"
                CLASS="coldfusion.server.ServiceFactory"
                NAME="factory">
      <!--- Get datasource service --->
      <CFSET dsService=factory.getDataSourceService()>
      <!--- Validate DSN --->
      <CFSET result=dsService.verifyDatasource(dsn)>

      <!--- If any error, return FALSE --->
	  <CFCATCH TYPE="any">
	     <CFSET result="false">
	  </CFCATCH>
   </CFTRY>

   <CFRETURN result>
</CFFUNCTION>