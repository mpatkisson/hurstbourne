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
 Sends a UDP packet.
 
 @param host 	 Host to send the UDP (Required)
 @param port 	 Port to send the UDP (Required)
 @param message 	 The message to transmit (Required)
 @return Returns nothing. 
 @author GaoChangwei (coldfusion.jQuery@gmail.com) 
 @version 1, August 5, 2011 
--->
<cffunction name="sendUDP" access="private" returntype="string" output="false">
	<cfargument name="host" type="string" required="yes" hint="Host to send the UDP">
	<cfargument name="port" type="numeric" required="yes" hint="Port to send the UDP">
	<cfargument name="message" type="string" required="yes"  hint="The message to transmit">

	<cfset var text = arguments.message />
	<cfset var msg = arraynew(1) />
	
	<cfset var i = 0>
	<cfloop index="i" from="1" to="#len(text)#">
		<cfset msg[i] = asc( Mid(text, i, 1) ) />
	</cfloop>
	<!--- Get the internet address of the specified host --->
	<cfset address = createObject("java", "java.net.InetAddress").getByName(arguments.host) />
	
	<!--- Initialize a datagram packet with data and address --->
	<cfset packet = createObject("java", "java.net.DatagramPacket").init( javacast("byte[]",msg), 
																		  javacast("int",arrayLen(msg)), 
																		  address, 
																		  javacast("int",arguments.port)) />
																		  
	<!--- Create a datagram socket, send the packet through it, close it. --->
	<cfset dsocket = createObject("java", "java.net.DatagramSocket") />	
	<cfset dsocket.send(packet) />
	<cfset dsocket.close() />

</cffunction>