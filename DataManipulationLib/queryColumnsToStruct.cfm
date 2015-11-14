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

<cfscript>
/**
 * Makes a struct for all values in a given column(s) of a query.
 * v2 by James Moberg
 * 
 * @param query 	 The query to operate on (Required)
 * @param keyColumn 	 The name of the column to use for the key in the struct (Required)
 * @param valueColumn 	 The name of the column in the query to use for the values in the struct (defaults to whatever the keyColumn is) (Optional)
 * @param reverse 	 Boolean value for whether to go through the query in reverse (default is false) (Optional)
 * @param retainSort 	 If true, a Java LinkedHashMap will be used to create the result. This will create a struct with ordered keys. Defaults to false. (Optional)
 * @return struct 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 2, January 24, 2011 
 */
function queryColumnsToStruct(query,keyColumn){
       var valueColumn = keyColumn;
       var reverse = false;
       var retainSort = false;
       var struct = structNew();
       var increment = 1;
       var ii = 1;
       var rowsGotten = 0;
       if(arrayLen(arguments) GT 2) valueColumn = arguments[3];
       if(arrayLen(arguments) GT 3) reverse = arguments[4];
       if(arrayLen(arguments) GT 4) retainSort = arguments[5];
       if(retainSort){
               struct = CreateObject("java", "java.util.LinkedHashMap").init();
       }
       if(reverse){
               ii = query.recordCount;
               increment = -1;
       }
       while(rowsGotten LT query.recordCount){
               struct[query[keyColumn][ii]] = query[valueColumn][ii];
               ii = ii + increment;
               rowsGotten = rowsGotten + 1;
       }
       return struct;
}
</cfscript>