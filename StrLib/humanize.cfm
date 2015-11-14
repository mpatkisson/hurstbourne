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
 Takes a string and humanizes it, removing underscores and capitalizing each word.
 
 @param text 	 String to parse. (Required)
 @return Returns a string. 
 @author Christopher Warren (cwarren@imagetrend.com) 
 @version 1, July 23, 2007 
--->
<cffunction name="humanize" access="public" returntype="string" output="false">
    <cfargument name="text" type="string" required="true" />
    <cfset arguments.text= ucase(arguments.text)>
    <cfset arguments.text= replace(arguments.text,"_"," ","all")>
    <cfreturn reReplace(arguments.text,"([[:upper:]])([[:upper:]]*)","\1\L\2\E","all") />
</cffunction>