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
 I generate a randomized string of desired length.
 
 @param theString 	 string of text to randomize (Required)
 @param theLength 	 length of random string to create (Required)
 @return returns a string 
 @author Stephen Withington (steve@stephenwithington.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="RandomizeString" returntype="string" output="false" access="public" 
			hint="pass me a string and desired length and i'll randomize it for you.">
	<cfargument name="theString" type="string" required="true" default="0123456789ABCDEF" />
	<cfargument name="theLength" type="numeric" required="true" default="32" />
	<cfset var randomizedString = "" />
	<cfset var theIndex = "" />

	<cfloop index="theIndex" from="1" to="#val(arguments.theLength)#" step="1">
		<cfset randomizedString = randomizedString & mid(arguments.theString, rand()*len(arguments.theString)+1, 1) />
	</cfloop>
	<cfreturn randomizedString />	
</cffunction>