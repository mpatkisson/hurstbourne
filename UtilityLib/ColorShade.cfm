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
 Returns a hexadecimal color value an amount lighter or darker than the provided color.
 
 @param hexColor 	 starting hex color (Required)
 @param shade 	 amount hexColor should be incremented(+)/decremented(-) (Required)
 @return returns a string 
 @author Bob Gray (gray.bob98@gmail.com) 
 @version 0, March 3, 2010 
--->
<cffunction name="ColorShade" returntype="string">

<cfargument name="hexColor" type="string" required="yes">
<cfargument name="shade" type="numeric" required="yes">
    
<cfset var red = "">
<cfset var green = "">
<cfset var blue = "">
<cfset var s = ARGUMENTS.shade>
<cfset var incrementedColor = ""> 

<cfset red = Left(ARGUMENTS.hexColor, 2)>
<cfset green = Mid(ARGUMENTS.hexColor, 3, 2)>
<cfset blue = Right(ARGUMENTS.hexColor, 2)>
	
<cfset red = NumberFormat(InputBaseN(red, 16), 00)>
<cfset green = NumberFormat(InputBaseN(green, 16), 00)>
<cfset blue = NumberFormat(InputBaseN(blue, 16), 00)>	
	
<cfset red = IIF(s LT 0, red * (s + 100) / 100, red + (255 - red) * s / 100)>
<cfset green = IIF(s LT 0, green * (s + 100) / 100, green + (255 - green) * s / 100)>
<cfset blue = IIF(s LT 0, blue * (s + 100) / 100, blue + (255 - blue) * s / 100)>
    
<cfset red = UCase(FormatBaseN(red, 16))>
<cfset green = UCase(FormatBaseN(green, 16))>
<cfset blue = UCase(FormatBaseN(blue, 16))>
    
<cfset red = IIF(Len(red) LT 2, DE(0&red), DE(red))>
<cfset green = IIF(Len(green) LT 2, DE(0&green), DE(green))>
<cfset blue = IIF(Len(blue) LT 2, DE(0&blue), DE(blue))>
    
<cfset incrementedColor = UCase(red&green&blue)>
    
<cfreturn incrementedColor>
    
</cffunction>