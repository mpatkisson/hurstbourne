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
 Turn a string into an array of lines.
 
 @param inString 	 The string to parse. (Required)
 @return Returns an array. 
 @author Massimo Foti (massimo@massimocorner.com) 
 @version 1, August 15, 2005 
--->
<cffunction name="string2linesArray" output="false" returntype="array" hint="Turn a string into an array of lines, using java.io.BufferedReader to maximize performances">
	<cfargument name="inString" type="string" required="yes" hint="Incoming string">
	<cfscript>
	var linesArray = ArrayNew(1);
	var jReader = createObject("java","java.io.StringReader").init(arguments.inString);
	var jBuffer = createObject("java","java.io.BufferedReader").init(jReader);
	var line = jBuffer.readLine();	
	</cfscript>
	<cftry>
	<!--- 
	Unlike Java, CFML has no notion of null, but this is quite a special case. 
	Whenever readLine() reach the end of the file, it return a Java null, 
	as soon as the BufferedReader return null, ColdFusion "erase" the line variable, making it undefined. 
	Here we leverage this somewhat weird behavior by using it as test condition for the loop
	 --->
		<cfloop condition="#IsDefined("line")#">
			<cfset ArrayAppend(linesArray, line)>
			<cfset line=jBuffer.readLine()>
		</cfloop>
		<cfset jBuffer.close()>
		<cfcatch type="any">
			<!--- Something went wrong; we better close the stream anyway, just to be safe and leave no garbage behind --->
			<cfset jBuffer.close()>
			<cfthrow message="string2linesArray: Failed to read lines from string" type="string2linesArray">
		</cfcatch>
	</cftry>
	<cfreturn linesArray>
</cffunction>