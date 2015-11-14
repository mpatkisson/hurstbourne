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
 Search a multidimensional array for a value.
 
 @param arrayToSearch 	 Array to search. (Required)
 @param valueToFind 	 Value to find. (Required)
 @param dimensionToSearch 	 Dimension to search. (Required)
 @return Returns a number. 
 @author Grant Szabo (grant@quagmire.com) 
 @version 1, September 23, 2004 
--->
<cffunction name="ArrayFindByDimension" access="public" returntype="numeric" output="false">
	<cfargument name="arrayToSearch" type="array" required="Yes">
	<cfargument name="valueToFind" type="string" required="Yes">
	<cfargument name="dimensionToSearch" type="numeric" required="Yes">
	<cfscript>
		var ii = 1;
		
		//loop through the array, looking for the value
		for(; ii LTE arrayLen(arguments.arrayToSearch); ii = ii + 1){
			//if this is the value, return the index
			if(NOT compareNoCase(arguments.arrayToSearch[ii][arguments.dimensionToSearch], arguments.valueToFind))
				return ii;
		}
		//if we've gotten this far, it means the value was not found, so return 0
		return 0;
	</cfscript>
</cffunction>