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
 Returns the mime type of the specified file.
 
 @param filePath 	 The file to examine, (Required)
 @return Returns a string. 
 @author Ben Rogers (ben@c4.net) 
 @version 1, July 19, 2005 
--->
<cffunction name="getFileMimeType" returntype="string" output="no">
	
	<cfargument name="filePath" type="string" required="yes">
	
	<cfreturn getPageContext().getServletContext().getMimeType(arguments.filePath)>
	
</cffunction>