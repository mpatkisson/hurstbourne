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
 Converts a java float to a 32-bit hexadecimal representation
 
 @param floatValue 	 Numeric value. (Required)
 @param usePadding 	 Boolean to determine if padding is used on the result. Defaults to true. (Optional)
 @return Returns a string. 
 @author Leigh (cfsearching@yahoo.com) 
 @version 0, June 22, 2010 
--->
<cffunction name="floatToHex" returntype="string" access="public" output="false"
        hint="Converts a java float value to a 32-bit hexadecimal representation (IEEE 754 floating-point number)">
    <cfargument name="floatValue" type="numeric" required="true" />
    <cfargument name="usePadding" type="boolean" default="true" />

    <cfset var floatRef = javacast("float", 0) />
    <cfset var intValue = floatRef.floatToIntBits( javacast("float", arguments.floatValue) ) />
    <cfset var result   = formatBaseN(intValue, 16) />

    <!--- pad hex value with leading zeroes --->
    <cfif arguments.usePadding>
        <cfset result =  right("00000000"& result, 8) />
    </cfif>
    
    <cfreturn result />
</cffunction>