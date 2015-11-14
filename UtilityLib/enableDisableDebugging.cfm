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
 This UDF will enable or disable debugging service with Admin access
 
 @param what 	 Either enable or disable.  (Required)
 @return Returns nothing. 
 @author Qasim Rasheed (qasim_1976@yahoo.com) 
 @version 1, April 14, 2005 
--->
<cffunction name="enableDisableDebugging" output="false" returntype="void" hint="I enable/disable debugging settings">
	<cfargument name="what" type="string" required="true" />	
	<cfset var db_service = createobject("java","coldfusion.server.ServiceFactory").getDebuggingService()>
	
	<cfif arguments.what eq "enable">
		<cfif not db_service.isEnabled()>
			<cfset db_service.setEnabled(true)>
		</cfif>
	<cfelseif arguments.what eq "disable">
		<cfif db_service.isEnabled()>
			<cfset db_service.setEnabled(false)>
		</cfif>
	</cfif>
</cffunction>