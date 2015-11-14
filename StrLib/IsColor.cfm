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
 Checkes to see if a color is a valid 3 or 6 character hex color, or one of the ColdFusion safe color keywords.
 
 @param color 	 string of color to test (Required)
 @return returns a Boolean 
 @author Jon Hartmann (jon.hartmann@gmail.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="IsColor" access="public" output="false" returntype="boolean">
    <cfargument name="color" type="string" required="true" />
        
    <cfset var local = structNew() />
    <cfset local.colorNames = "aqua,black,blue,fuchsia,gray,green,lime,maroon,navy,olive,purple,red,silver,teal,white,yellow" />
    <cfset local.regex = "^(##([\dA-F]{3}|[\dA-F]{6})|([\dA-F]{3}|[\dA-F]{6}))$" />
    <cfset local.returnValue = false />
        
    <cfif listFind(local.colorNames, arguments.color) OR arrayLen(REMatchNoCase(local.regex, arguments.color)) gt 0>
        <cfset local.returnValue = true />
    </cfif>
    
    <cfreturn local.returnValue />
</cffunction>