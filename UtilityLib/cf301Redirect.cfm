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
 Takes a url and 301 redirects to user to that url.
 
 @param urlString 	 URL to push the user to. (Required)
 @return Returns nothing. 
 @author Erik Vold (erikvvold@gmail.com) 
 @version 0, December 6, 2008 
--->
<cffunction name="cf301Redirect" access="public" returntype="void" output="false">
  <cfargument name="urlString" type="string" required="yes" />
  
  <!--- 301 redirect the user to the provided url --->
  <cfheader statuscode="301" statustext="Moved permanently" />
  <cfheader name="Location" value="#arguments.urlString#" />
</cffunction>