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
 Compresses javascript code
 
 @param JScode 	 javascript code to compress (Required)
 @param bRem 	 Boolean flag to remove block comments (Optional)
 @return Returns a string. 
 @author Jose Alberto Guerra (cheveguerra@gmail.com) 
 @version 1, March 25, 2010 
--->
<cffunction name="jsCompressor" returntype="string" description="Compresses javascript code" output="false">
	<cfargument name="jscode" type="string" required="yes">
	<cfargument name="brem" type="boolean" required="no" default="true">
	<cfargument name="lrem" type="boolean" required="no" default="true">
	<cfargument name="spc" type="boolean" required="no" default="true">
	<cfargument name="ret" type="boolean" required="no" default="true">
	<cfset var linerem= "[^:]\/\/[^#chr(13)##chr(10)#]*">
	<cfset var blockrem1="/\*">
	<cfset var blockrem2="\*/">
	<cfset var blockrem="#chr(172)#[^#chr(172)#]*#chr(172)#">
	<cfset var spaces="[\s]*([\=|\{|\}|\(|\)|\;|[|\]|\+|\-|\n|\r]+)[\s]*">
	<cfset var retornos="[\r\n\f]*">
	<cfif brem>
		<cfset jscode = rereplacenocase(jscode,blockrem1,"#chr(172)#","all")>
		<cfset jscode = rereplacenocase(jscode,blockrem2,"#chr(172)#","all")>
		<cfset jscode = rereplacenocase(jscode,blockrem,"","all")>
	</cfif>
	<cfif lrem><cfset jscode = rereplacenocase(jscode,linerem,"","all")></cfif>
	<cfif spc><cfset jscode = rereplacenocase(jscode,spaces,"\1","all")></cfif>
	<cfif ret><cfset jscode = rereplacenocase(jscode,retornos,"","all")></cfif>
	<cfreturn jscode>
</cffunction>