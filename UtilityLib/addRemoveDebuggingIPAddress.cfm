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
 This function will either add or remove an IP address to the list of debugging ip addresses if you do not have an administrator access.
 
 @param ipAddress 	 IP Address (Required)
 @param action 	 Add or Remove. Defaults to Add. (Optional)
 @return Returns a list of IP addresses. 
 @author Qasim Rasheed (qasim_1976@yahoo.com) 
 @version 1, February 17, 2004 
--->
<cffunction name="addRemoveDebuggingIPAddress" output="false" returnType="string">
	<cfargument name="IPaddress" type="string" required="Yes" />
	<cfargument name="action" type="string" default="Add" />
	<cfscript>
		var factory = CreateObject("Java","coldfusion.server.ServiceFactory");
		var debuggingService  ="";
	</cfscript>
	<cflock name="factory_debuggingservice" type="exclusive" timeout="5">
		<cfset debuggingService = factory.getDebuggingService()>
		<cfswitch expression="#arguments.action#">
			<cfcase value="Add">
				<cfif not listcontainsnocase(debuggingService.iplist.ipList,arguments.IPaddress)>
					<cfset debuggingService.iplist.ipList = ListAppend(debuggingService.iplist.ipList,arguments.IPaddress)>
				</cfif>
			</cfcase>
			<cfcase value="Remove">
				<cfif listcontainsnocase(debuggingService.iplist.ipList,arguments.IPaddress)>
					<cfset debuggingService.iplist.ipList = ListDeleteAt(debuggingService.iplist.ipList,ListFindNoCase(debuggingService.iplist.ipList,arguments.IPaddress))>
				</cfif>
			</cfcase>
		</cfswitch>
		<cfreturn debuggingService.iplist.ipList />
	</cflock>
</cffunction>