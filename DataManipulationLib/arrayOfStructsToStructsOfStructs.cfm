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
 Converts an array of structures to an structure of structures,
 
 @param array 	 An array of structs. (Required)
 @param key 	 A key value to use for the new structure. Must exist in all structs in the array. (Required)
 @return Returns a struct. 
 @author Tayo Akinmade (olusina@hotmail.com) 
 @version 0, June 11, 2009 
--->
<cffunction name="ArrayOfStructsToStructsOfStructs" access="public" output="false" returntype="struct" hint="Converts an array of structs to an struct of structs">
		<cfargument name="array" type="array" required="true" hint="An array of structures">
		<cfargument name="key" type="string" required="true" hint="Key to use">
		
		<cfscript>
			var stStructOfStructs = structNew();
			var i = 0;
			
			// loop over array
			for(i=1;i lte arrayLen(arguments.array);i=i+1){
				stStructOfStructs[arguments.array[i][arguments.key]] = arguments.array[i];
			}
			
		    return stStructOfStructs;
		    
		</cfscript>		
	</cffunction>