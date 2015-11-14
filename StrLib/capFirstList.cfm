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
 Capitalize the first letter of each item in a list.
 
 @param str 	 List to parse. (Required)
 @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 @return Returns a string. 
 @author Randy Johnson (randy@cfconcepts.com) 
 @version 1, May 30, 2010 
--->
<cffunction name="capFirstList" returntype="string" output="false">
    <cfargument name="str" type="string" required="true" />
    <cfargument name="delimiter" default="," required="false">

    <cfset var newstr = "" />
    <cfset var word = "" />
    <cfset var separator = "" />

    <cfloop index="word" list="#arguments.str#" delimiters="#arguments.delimiter#">
        <cfset newstr = newstr & separator & UCase(left(word,1)) />
        <cfif len(word) gt 1>
            <cfset newstr = newstr & right(word,len(word)-1) />
        </cfif>
        <cfset separator = arguments.delimiter />
    </cfloop>

    <cfreturn newstr />
</cffunction>