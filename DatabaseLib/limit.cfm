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
 Mimics MySQL limit's function.
 v2 mods by Raymond Camden and Steven Van Gemert
 
 @param inQry 	 Query to modify. (Required)
 @param arg1 	 Row to begin the limit. (Required)
 @param arg2 	 Number of rows to limit the result to. (Required)
 @return Returns a query. 
 @author Andy Jarrett (mail@andyjarrett.co.uk) 
 @version 2, February 13, 2009 
--->
<cffunction name="limit" returntype="query" description="WORKS LIKE MYSQL LIMIT(N,N)" output="false">
	<cfargument name="inQry" type="query" hint="I am the query" />
	<cfargument name="arg1" type="numeric" />
	<cfargument name="arg2" type="numeric" />
    
	<cfscript>
	var outQry = arguments.inQry;
	var a1 = arguments.arg1-1;
	
	if(arg1 GT 1){
	    outQry.RemoveRows(JavaCast( "int", 0 ), JavaCast( "int", a1 ));
	}
	
	outQry.RemoveRows(JavaCast( "int", arg2 ),JavaCast( "int", outQry.recordcount-arg2));
	
	return outQry;
	</cfscript>
</cffunction>