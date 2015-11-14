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
 This function will enable or disable whitespace management in ColdFusion Server without access to ColdFusion Administrator.
 
 @param action 	 Either disable or enable. Defaults to enable. (Optional)
 @return Returns a boolean. 
 @author Qasim Rasheed (qasim_1976@yahoo.com) 
 @version 1, February 14, 2004 
--->
<cffunction name="enableDisableWhiteSpaceManagement" output="false" returntype="boolean">
	<cfargument name="action" type="string" default="enable" />
	<cfscript>
		var factory = CreateObject("Java","coldfusion.server.ServiceFactory");
		var runtime = "";
		
	</cfscript>
	<cflock name="factory_runtimeservice" type="exclusive" timeout="5">
		<cfset runtime = factory.getRuntimeService()>
		<cfswitch expression="#arguments.action#">
			<cfcase value="enable">
				<cfif not runtime.WhiteSpace>
					<cfset runtime.setWhiteSpace("YES")>
				</cfif>
			</cfcase>
			<cfcase value="disable">
				<cfif runtime.WhiteSpace>
					<cfset runtime.setWhiteSpace("NO")>
				</cfif>
			</cfcase>
		</cfswitch>
	</cflock>
	<cfreturn runtime.WhiteSpace />
</cffunction>