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
 returns 'true' if the currentthread is a cfthread, rerturns false otherwise
 
 @return Returns a boolean. 
 @author Mark Mandel (mark@compoundtheory.com) 
 @version 1, April 11, 2008 
--->
<cffunction name="amInCFThread" hint="returns 'true' if the current thread if a cfthread, rerturns false otherwise" access="public" returntype="boolean" output="false">
	<cfscript>
		var Thread = createObject("java", "java.lang.Thread");

		if(Thread.currentThread().getThreadGroup().getName() eq "cfthread")
		{
			return true;
		}

		return false;
	</cfscript>
</cffunction>