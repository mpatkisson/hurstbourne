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
 * Converts a query object into a structure of structures accessible by its primary key.
 * v2 mod by James Moberg - added retainSort
 * 
 * @param theQuery 	 The query you want to convert to a structure of structures. (Required)
 * @param primaryKey 	 Query column to use as the primary key. (Required)
 * @param retainSort 	 If true, a Java LinkedHashMap will be used to create the result. This will create a struct with ordered keys. Defaults to false. (Optional)
 * @return Returns a structure. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 2, January 26, 2011 
 */
function QueryToStructOfStructures(theQuery, primaryKey){
       var theStructure  = structnew();
       /* remove primary key from cols listing */
       var cols          = ListToArray(ListDeleteAt(theQuery.columnlist, ListFindNoCase(theQuery.columnlist, primaryKey)));
       var row           = 1;
       var thisRow       = "";
       var col           = 1;
       var retainSort = false;
       if(arrayLen(arguments) GT 2) retainSort = arguments[3];
       if(retainSort){
               theStructure = CreateObject("java", "java.util.LinkedHashMap").init();
       }
       for(row = 1; row LTE theQuery.recordcount; row = row + 1){
               thisRow = structnew();
               for(col = 1; col LTE arraylen(cols); col = col + 1){
                       thisRow[cols[col]] = theQuery[cols[col]][row];
               }
               theStructure[theQuery[primaryKey][row]] = duplicate(thisRow);
       }
       return(theStructure);
}
</cfscript>