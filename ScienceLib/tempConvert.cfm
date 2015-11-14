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
 Converts temperatures from and to Celsius, Fahrenheit and Kelvin.
 
 @param otemp 	 Temperature. (Required)
 @param ctype 	 Two character string that determines the conversion. (Required)
 @return Returns a string. 
 @author Jack Poe (jackpoe@yahoo.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="tempConvert" output="false" returnType="string">

	<cfargument name="otemp" required="yes" type="numeric">
	<cfargument name="ctype" required="yes" type="string">
	
	<cfif arguments.ctype IS 'CF'>
		<cfset convertedtTemp = (arguments.otemp*1.8)+32>
		<cfset convertedtTemp = convertedtTemp & '&ordm; F'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'FC'>
		<cfset convertedtTemp = (arguments.otemp-32)*0.5555>
		<cfset convertedtTemp = convertedtTemp & '&ordm; C'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'CK'>
		<cfset convertedtTemp = arguments.otemp+273.15>
		<cfset convertedtTemp = convertedtTemp & '&ordm; K'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'KC'>
		<cfset convertedtTemp = arguments.otemp-273.15>
		<cfset convertedtTemp = convertedtTemp & '&ordm; C'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'FK'>
		<cfset convertedtTemp = ((arguments.otemp-32)*0.5555)+273.15>
		<cfset convertedtTemp = convertedtTemp & '&ordm; K'>
		<cfreturn convertedtTemp>
	<cfelseif arguments.ctype IS 'KF'>
		<cfset convertedtTemp = ((arguments.otemp-273.15)*1.8)+32>
		<cfset convertedtTemp = convertedtTemp & '&ordm; K'>
		<cfreturn convertedtTemp>
	</cfif>

</cffunction>