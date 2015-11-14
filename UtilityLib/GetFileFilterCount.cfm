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
 Accepts a directory path &amp; a file filter.  Returns number of matching files.
 
 @param directory 	 directory path (Required)
 @param filter 	 filter (Required)
 @return Returns a number. 
 @author James Moberg (james@ssmedia.com) 
 @version 1, January 4, 2012 
--->
rsion 1, May 17, 2011
*/
<cffunction name="GetFileFilterCount" returntype="numeric" output="no">
	<cfargument name="directory" type="string" required="true" />
	<cfargument name="filter" type="string" required="true" />
	<cfset var theCount = 0 />
	<cfset var checkfiles = "">

	<cfif directoryExists(arguments.directory)>
		<cfdirectory action="LIST" directory="#arguments.directory#" name="CheckFiles" filter="#arguments.filter#" type="file" listinfo="name">
		<cfset theCount = CheckFiles.RecordCount />
	</cfif>
	<cfreturn theCount />
</cffunction>