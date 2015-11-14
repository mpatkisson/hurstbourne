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
 Outputs a load of variables for debugging purposes.
 
 @param scopes 	 Scopes to display. Must be one of: variables,form,url,request,cookie,session,client,application,server,cgi (Optional)
 @return Returns a string. 
 @author Eric C. Davis (cflib@10mar2001.com) 
 @version 1, April 30, 2003 
--->
<cffunction name="debugVars" output="true" returntype="string" access="public" hint="Output more extensive debugging information than just the CF debug info" displayname="DebugVars()">
   <cfargument name="scopes" required="false" default="variables,form,url,request,cookie,session,client,application,server,cgi" hint="Scopes to be dumped" type="string" displayname="Scopes" />
   <cfsavecontent variable="returnVar">
      <cfloop list="#arguments.scopes#" index="myScope" delimiters=",">
         <cftry>
            <cfdump label="#Trim(myScope)#" var="#Evaluate(Trim(myScope))#" />
            <cfcatch>
               <cfoutput>
                  #cfcatch.Message#
               </cfoutput>
            </cfcatch>
         </cftry>
      </cfloop>
   </cfsavecontent>
   <cfreturn returnVar />
</cffunction>