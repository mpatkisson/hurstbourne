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
 Pings a website using .net framework
 
 @param host 	 URL/IP that you would like to ping. (Required)
 @return A string containing the results of the ping. 
 @author Elias (eliasjp@msn.com) 
 @version 1, October 14, 2008 
--->
<cffunction name="Ping" returntype="string" output="false" access="public">
    <cfargument name="host" type="string" required="yes">
    <!--- Local vars --->
    <cfset var pingClass="">
    <cfset var pingReply="">
    <!--- Get Ping class --->
    <cfobject type=".NET" name="pingClass"
            class="System.Net.NetworkInformation.Ping">
    <!--- Perform synchronous ping (using defaults) ---> 
    <cfset pingReply=pingClass.Send(Arguments.host)>
    <!--- Return result --->
    <cfreturn pingReply.Get_Status().ToString()>
</cffunction>