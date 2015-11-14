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
 Gets available and total file space for all volumes on a server.
 
 @return Returns an array. 
 @author Sigi (siegfried.heckl@siemens.com) 
 @version 1, October 11, 2011 
--->
<cffunction name="getFileSpace" access="public" output="false" returntype="array" hint="returns disk filespaces of the server">
  <cfset var local = {} />
  <cfset var i = "">

  <cfobject type="java" action="create" class="java.io.File" name="local.objFile" />
  <cfset local.aDrives = local.objFile.listRoots() />
  <cfset local.aResult = [] />

  <cfloop array="#local.aDrives#" index="i">
    <cfset local.strTemp = { drivename = i.getAbsolutePath(),
                             available = i.getFreeSpace(),
                             total     = i.getTotalSpace() } />
    <cfset arrayAppend(local.aResult, local.strTemp) />
  </cfloop>

  <CFRETURN local.aResult />
</cffunction>