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
 Connect to sockets through your ColdFusion application.
 Mods by Raymond Camden
 
 @param host 	 Host to connect to. (Required)
 @param port 	 Port for connection. (Required)
 @param message 	 Message to be sent. (Required)
 @return Returns a string. 
 @author George Georgiou (george1977@gmail.com) 
 @version 1, August 27, 2009 
--->
<cffunction name="easySocket" access="private" returntype="any" hint="Uses Java Sockets to connect to a remote socket over TCP/IP" output="false">

    <cfargument name="host" type="string" required="yes" default="localhost" hint="Host to connect to and send the message">
    <cfargument name="port" type="numeric" required="Yes" default="8080" hint="Port to connect to and send the message">
    <cfargument name="message" type="string" required="yes" default="" hint="The message to transmit">

   <cfset var result = "">
   <cfset var socket = createObject( "java", "java.net.Socket" )>
   <cfset var streamOut = "">
	<cfset var output = "">
	<cfset var input = "">

   <cftry>
      <cfset socket.init(arguments.host,arguments.port)>
      <cfcatch type="Object">
         <cfset result = "Could not connected to host <strong>#arguments.host#</strong>, port <strong>#arguments.port#</strong>.">
         <cfreturn result>
      </cfcatch>  
   </cftry>

   <cfif socket.isConnected()>
       <cfset streamOut = socket.getOutputStream()>
       
       <cfset output = createObject("java", "java.io.PrintWriter").init(streamOut)>
       <cfset streamInput = socket.getInputStream()>
       
       <cfset inputStreamReader= createObject( "java", "java.io.InputStreamReader").init(streamInput)>
       <cfset input = createObject( "java", "java.io.BufferedReader").init(InputStreamReader)>
        
       <cfset output.println(arguments.message)>
       <cfset output.println()> 
       <cfset output.flush()>
       
       <cfset result=input.readLine()>
       <cfset socket.close()>
   <cfelse>
      <cfset result = "Could not connected to host <strong>#arguments.host#</strong>, port <strong>#arguments.port#</strong>.">
   </cfif>
   
   <cfreturn result>
</cffunction>