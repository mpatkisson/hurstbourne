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
 Returns the index position of the last matching character in a string.
 v2 rewrite by Raymond Camden
 
 @param targetString 	 String to check. (Required)
 @param lastChar 	 Character to look for. (Required)
 @return Returns a number. 
 @author Chris Douglas (chrisgdouglas@gmail.com) 
 @version 2, August 16, 2008 
--->
<cffunction name="lastIndexOf" returntype="numeric" output="no">
	<cfargument name="targetString" type="string" required="yes">
	<cfargument name="lastChar" type="string" required="yes">
  
	<cfif find(lastChar, arguments.targetString)>
		<cfreturn len(arguments.targetString) - find(lastChar,reverse(arguments.targetString))>  
	<cfelse>
		<cfreturn 0>
	</cfif>
	
</cffunction>