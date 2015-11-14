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
 An arraySlice using Java 1.4 ArrayList built-in method.
 
 @param thisArray 	 Array to slice. (Required)
 @param start 	 Starting value (defaults to 1). (Optional)
 @param length 	 Length of slice (defaults to 0 which will return the entire rest of the items after the start value). (Optional)
 @return Returns an array. 
 @author G.Arlington (germann_arlington@yahoo.co.uk) 
 @version 0, June 11, 2009 
--->
<cffunction name="arraySlice2" returntype="array" output="false">
	<cfargument name="thisArray" required="true" type="array" />
	<cfargument name="start" required="false" type="numeric" default="1" />
	<cfargument name="length" required="false" type="numeric" default="0" />
	<cfset var resArray = createObject("java", "java.util.ArrayList").Init(arguments.thisArray) />
	<cfset var thisArrayLen = ArrayLen(arguments.thisArray) />
	<cfset var finish = 0 />
	<cfif (arguments.length EQ 0) OR ((arguments.start + arguments.length - 1) GT thisArrayLen)>
		<cfset arguments.length = thisArrayLen - arguments.start + 1 />
	</cfif>
	<cfset finish = arguments.start + arguments.length - 1 />

	<cfreturn resArray.subList(JavaCast("int", arguments.start - 1), JavaCast("int", finish)) />
</cffunction>