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
 Reads a file containing WDDX and returns the CF variable.
 Updated for CFMX var scope syntax.
 
 @param file 	 File to read and deserialize. (Required)
 @return Returns deserialized data. 
 @author Nathan Dintenfass (nathan@changemedia.com) 
 @version 2, October 15, 2002 
--->
<cffunction name="WDDXFileRead" output="no">
	<cfargument name="file" required="yes">
	
	<cfset var tempPacket = "">
	<cfset var tempVar = "">
	
	<!--- make sure the file exists, otherwise, throw an error --->
	<cfif NOT fileExists(file)>
		<cfthrow message="WDDXFileRead() error: File Does Not Exist" detail="The file #file# called in WDDXFileRead() does not exist">
	</cfif>
	<!--- read the file --->
	<cffile action="read" file="#file#" variable="tempPacket">
	<!--- make sure it is a valid WDDX Packet --->
	<cfif NOT isWDDX(tempPacket)>
		<cfthrow message="WDDXFileRead() error: Bad Packet" detail="The file #file# called in WDDXFileRead() does not contain a valid WDDX packet">		
	</cfif>
	<!--- deserialize --->
	<cfwddx action="wddx2cfml" input="#tempPacket#" output="tempVar">
	<cfreturn tempVar>    
</cffunction>