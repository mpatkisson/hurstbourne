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
 Call the skype website to know the status of a user
 
 @param userName 	 The Skype username to check. (Required)
 @param numeric 	 Boolean value that determines if the numeric or textual status is returned. (Optional)
 @param timeout 	 Default timeout for the HTTP call. Defaults to 20 seconds. (Optional)
 @return Returns a string. 
 @author Giampaolo Bellavite (gp@omniwhere.com) 
 @version 0, June 11, 2009 
--->
<cffunction name="getSkypeStatus" access="" returntype="any" output="false" 
			  hint="Call the skype website to know the status of a user">
	<cfargument name="userName" type="string" required="true" hint="The Skype username to check">
	<cfargument name="numeric" type="boolean" required="false" default="false" hint="Return the numeric status (default is textual)">	
	<cfargument name="timeOut" type="numeric" required="false" default="20" hint="Timeout while asking the skype service">	

	<cfset var cfhttp = "">
	<cfhttp url="http://mystatus.skype.com/#userName#.#IIF(numeric,DE('num'),DE('txt'))#" timeout="#timeout#">
	<cfreturn cfhttp.fileContent>
</cffunction>