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
 Upper cases the first letter of a string.
 Phil Arnold (philip.r.j.arnold@googlemail.com
 
 @param name 	 String to capitalize the first letter of (Required)
 @return Returns a string. 
 @author Brian Meloche (brianmeloche@gmail.com) 
 @version 0, March 17, 2010 
--->
<cffunction name="upperFirst" access="public" returntype="string" output="false" hint="I convert the first letter of a string to upper case, while leaving the rest of the string alone.">
		<cfargument name="name" type="string" required="true">
		<cfreturn uCase(left(arguments.name,1)) & right(arguments.name,len(arguments.name)-1)>
</cffunction>