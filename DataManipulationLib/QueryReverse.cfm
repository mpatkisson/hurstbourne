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
 * Reverse the order of a query.
 * 
 * @param qryOriginal 	 Name of the query you want to reverse (Required)
 * @return Returns a query object. 
 * @author David Whiterod (whiterod.david@saugov.sa.gov.au) 
 * @version 1, June 27, 2002 
 */
function QueryReverse (qryOriginal) {
	
  // Reverse the order of qryOriginal
  // Make a new query using the same columns as qryOriginal
  var qryNew = QueryNew(qryOriginal.ColumnList);
  var row = 1;
  var column = 1;
  //Loop through qryOriginal in reverse order (last becomes first)
  for(row=qryOriginal.recordCount;row gte 1; row=row-1) {
    //Add a new row in the new query
    QueryAddRow(qryNew,1);
    //Get the values for each column in qryOriginal
    for(column=1;column lte ListLen(qryOriginal.ColumnList);column=column+1) {
      QuerySetCell(qryNew, ListGetAt(qryOriginal.ColumnList,column), qryOriginal[ListGetAt(qryOriginal.ColumnList,column)][row]);
    }
  }
  
  return qryNew;
  
}
</cfscript>