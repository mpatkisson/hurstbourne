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
 A better version of getLocale.
 
 @return Returns a struct. 
 @author Reinhard Jung (reinhard.jung@gmail.com) 
 @version 1, June 13, 2008 
--->
<cffunction name="getLocaleInfo" description="gets the Locale" output="false">
    <cfset var myLocale = structNew() />
    <cfset var currentLocale    = CreateObject("java", "java.util.Locale").getDefault() />
    <cfset myLocale.short.country        = currentLocale.getCountry() />
    <cfset myLocale.short.language    = currentLocale.getLanguage() />
    <cfset myLocale.short                        = myLocale.short.language &'_' &myLocale.short.country />
    <cfset myLocale.long                        = getLocale() />
    <cfset myLocale.full                        = getLocaleDisplayName() />

    <cfreturn myLocale />
</cffunction>