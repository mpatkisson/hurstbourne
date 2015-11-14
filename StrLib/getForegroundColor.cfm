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
 Determines a light or dark text color based on the given background color.
 
 @param backgroundHEX 	 string containing HEX color (Required)
 @return returns a string 
 @author Scott Lingle (sal21@psu.edu) 
 @version 0, May 9, 2009 
--->
<cffunction name="getForegroundColor" output="false" access="private" returntype="string" hint="gets the appropriate FG color.">
    <cfargument name="backgroundHEX" required="true" />
    <cfscript>
        // clean up the incoming color, strip the pound sign.
        var cleanHex = Replace(arguments.backgroundHEX,"##","");
        // break the hex up and convert to RGB
        var R = InputBaseN(Mid(cleanHex, 1, 2),16);
        var G = InputBaseN(Mid(cleanHex, 3, 2),16);        
        var B = InputBaseN(Mid(cleanHex, 5, 2),16);
        
        //determine the backgrounds 'brightness' (from a W3C Accessibility draft)
        var brightness = ((R * 299) + (G * 587) + (B * 114)) / 1000;
        //determine if it is a light or dark background and set the return to either black or white.
        if(255 - brightness lt 128) {
            return "##000000";
        } else {
            return "##ffffff";
        }
    </cfscript>    
</cffunction>