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
 Returns true if the specified task name exists as a scheduled task in the CF Administrator.
 
 @param Task 	 Task name you want to verify. (Required)
 @return Returns a Boolean. 
 @author Rob Brooks-Bilson (rbils@amkor.com) 
 @version 1, October 16, 2002 
--->
<CFFUNCTION NAME="IsScheduledTask" RETURN="Boolean">
  <CFARGUMENT NAME="TaskName" REQUIRED="True" TYPE="String">
  <!--- var local vars for the func --->
  <CFSET Var TaskXML="">
  <CFSET Var GetTasks="">
  
  <!--- get the scheduler xml file.  It's stored as WDDX --->
  <CFFILE ACTION="Read"
          FILE="#Server.ColdFusion.RootDir#\lib\neo-cron.xml"
          VARIABLE="TaskXML">
  
  <!--- convert the WDDX to CFML - and array of structs --->        
  <CFWDDX ACTION="WDDX2CFML" INPUT="#TaskXML#" OUTPUT="GetTasks"> 
  
  <!--- search the array of structs for the name passed to the func --->
  <CFIF ListContainsNoCase(StructKeyList(GetTasks[1]), Arguments.TaskName) EQ 0>
    <CFRETURN False>
  <CFELSE>
    <CFRETURN True>
  </CFIF>
</CFFUNCTION>