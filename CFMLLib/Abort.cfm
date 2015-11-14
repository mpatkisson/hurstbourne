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
 Mimics the cfabort tag.
 
 @param showError 	 An error to throw. (Optional)
 @return Does not return a value. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, October 16, 2002 
--->
<cffunction name="abort" output="false" returnType="void">
	<cfargument name="showError" type="string" required="false">
	<cfif isDefined("showError") and len(showError)>
		<cfthrow message="#showError#">
	</cfif>
	<cfabort>
</cffunction>