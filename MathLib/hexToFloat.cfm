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
 Converts a 32-bit hexadecimal floating-point number to a java float
 
 @param hex 	 Hex input. (Required)
 @return Returns a number. 
 @author Leigh (cfsearching@yahoo.com) 
 @version 1, June 22, 2010 
--->
<cffunction name="hexToFloat" returntype="numeric" access="public" output="false"
        hint="Converts a 32-bit hexadecimal representation (IEEE 754 floating-point number) to a java Float">
    <cfargument name="hex" type="string" required="true" />

    <cfset var longValue     = "">

    <cfif reFindNoCase("[^[:xdigit:]]", arguments.hex)>
        <cfthrow message="Argument.hex does not contain a recognized hexidecimal string" type="InvalidArgument" />
    </cfif>
    
    <cfset longValue = javacast("long", 0).parseLong( arguments.hex, 16 ) />
    <cfreturn javacast("float", 0).intBitsToFloat( longValue.intValue() ) />
</cffunction>