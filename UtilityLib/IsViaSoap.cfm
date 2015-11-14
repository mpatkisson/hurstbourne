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
 Returns true if the curent request is SOAP based.
 
 @return Returns a boolean. 
 @author Ben Forta (ben@forta.com) 
 @version 1, August 28, 2003 
--->
<cffunction name="isViaSoap" returnType="boolean" output="no">
   <!--- Get current message context --->
   <cfset var ctx = createObject("java", "org.apache.axis.MessageContext").getCurrentContext()>
	
   <!--- Invoke (cheap) method to see if it is null --->
   <cftry>
      <cfset ctx.isclient()>
      <cfcatch type="any">
         <cfreturn false>
      </cfcatch>
   </cftry>

   <cfreturn true>

</cffunction>