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
 * Converts an array of objects to a CF Query Object.
 * 
 * @param theArray 	 The array of CFCs. (Required)
 * @return Returns a query. 
 * @author Don Quist (don.sigmaprojects@gmail.com) 
 * @version 0, June 11, 2009 
 */
function arrayOfObjectsToQuery(theArray){
    var colNames = ArrayNew(1);
    var theQuery = queryNew("");
    var i=0;
    var j=0;
	var o=0;
	var functions = '';
    //if there's nothing in the array, return the empty query
    if(NOT arrayLen(theArray)) return theQuery;
	
	//get meta data for the first object in the array and set the functions
	functions = getMetaData(theArray[1]).functions;
    //get the column names into an array =    
	for(o=1; o LTE arrayLen(functions); o=o+1){
		if( REFindNoCase( 'get+', functions[o].NAME ) and functions[o].NAME IS NOT 'init' ) {
			arrayAppend(colNames, LCase(REReplaceNoCase(functions[o].NAME, "^get",'' )) );
		}
	}

	theQuery = queryNew(arrayToList(colNames));
	
    //add the right number of rows to the query
    queryAddRow(theQuery, arrayLen(theArray));
    //for each element in the array, loop through the columns, populating the query
    for(i=1; i LTE arrayLen(theArray); i=i+1){
        for(j=1; j LTE arrayLen(colNames); j=j+1){
			//bug out incase something isnt defined in the object
			try {
				querySetCell(theQuery, colNames[j], Evaluate('theArray[i].get#colNames[j]#()'), i);
			}
			catch(Any excpt) { }
        }
    }
    return theQuery;
}
</cfscript>