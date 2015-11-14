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
 Reset MailSpool and access general mail settings.
 
 @param mailaction 	 One of: isspoolenable,getserver,resetspool (Required)
 @return Returns a string or boolean. 
 @author Jose Diaz (bleachedbug@gmail.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="cfMailFactory" access="public" returntype="string" output=false>
	<cfargument name="mailaction" type="string" required="true"/>
	<cfset var mailItem = "">
	<cfset var factory = "">
	<cfset var mm_service = "">
	<cfset var mm_settings = "">
			
	<!--- Access CF Service Factory --->
	<cfobject action="create" type="java" class="coldfusion.server.ServiceFactory" name="factory"/>

	<!--- Begin Action Checks --->
	<cfswitch expression="#trim(arguments.mailaction)#">

		<cfcase value="isSpoolEnable">
			<cfset mailItem = factory.mailSpoolService.isSpoolEnable()>
		</cfcase>

		<cfcase value="resetSpool">
		
			<cflock name="serviceFactory" type="exclusive" timeout="10">
			<cfscript>
			ms_service = factory.mailspoolservice;
			ms_settings = ms_service.settings;
			</cfscript>
			</cflock>
			
			<cfset mailItem = "Reset Successfull">
		</cfcase>

 		<cfcase value="getServer">
	      <cfset mailItem = factory.mailSpoolService.getServer()>
	    </cfcase>

	    <cfdefaultcase>
	    	<cfthrow message="Invalid mail action passed. Must be resetSpool, getServer, or isSpoolEnable.">
	    </cfdefaultcase>

	 </cfswitch>

	<cfreturn mailItem />

</cffunction>