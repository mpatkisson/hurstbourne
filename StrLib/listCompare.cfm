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
 Compares one list against another to find the elements in the first list that don't exist in the second list.
 v2 mod by Scott Coldwell
 
 @param List1 	 Full list of delimited values. (Required)
 @param List2 	 Delimited list of values you want to compare to List1. (Required)
 @param Delim1 	 Delimiter used for List1.  Default is the comma. (Optional)
 @param Delim2 	 Delimiter used for List2.  Default is the comma. (Optional)
 @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma. (Optional)
 @return Returns a delimited list of values. 
 @author Rob Brooks-Bilson (rbils@amkor.com) 
 @version 2, June 25, 2009 
--->
<cffunction name="listCompare" output="false" returnType="string">
       <cfargument name="list1" type="string" required="true" />
       <cfargument name="list2" type="string" required="true" />
       <cfargument name="delim1" type="string" required="false" default="," />
       <cfargument name="delim2" type="string" required="false" default="," />
       <cfargument name="delim3" type="string" required="false" default="," />

       <cfset var list1Array = ListToArray(arguments.List1,Delim1) />
       <cfset var list2Array = ListToArray(arguments.List2,Delim2) />

       <!--- Remove the subset List2 from List1 to get the diff --->
       <cfset list1Array.removeAll(list2Array) />

       <!--- Return in list format --->
       <cfreturn ArrayToList(list1Array, Delim3) />
</cffunction>