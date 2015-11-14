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
 * CSVFormat accepts the name of an existing query and converts it to csv format.
 * Updated version of UDF orig. written by Simon Horwith
 * 
 * @param query 	 The query to format. (Required)
 * @param qualifer 	 A string to qualify the data with. (Optional)
 * @param columns 	 The columns ot use. Defaults to all columns. (Optional)
 * @return A CSV formatted string. 
 * @author Jeff Howden (cflib@jeffhowden.com) 
 * @version 2, August 26, 2008 
 */
function CSVFormat(query) {
  var returnValue = ArrayNew(1);
  var rowValue = '';
  var columns = query.columnlist;
  var qualifier = '';
  var i = 1;
  var j = 1;
  if(ArrayLen(Arguments) GTE 2) qualifier = Arguments[2];
  if(ArrayLen(Arguments) GTE 3 AND Len(Arguments[3])) columns = Arguments[3];
  returnValue[1] = ListQualify(columns, qualifier);
  ArrayResize(returnValue, query.recordcount + 1);
  columns = ListToArray(columns);
  for(i = 1; i LTE query.recordcount; i = i + 1)
  {
    rowValue = ArrayNew(1);
    ArrayResize(rowValue, ArrayLen(columns));
    for(j = 1; j LTE ArrayLen(columns); j = j + 1)
      rowValue[j] = qualifier & query[columns[j]][i] & qualifier;
    returnValue[i + 1] = ArrayToList(rowValue);
  }		
  returnValue = ArrayToList(returnValue, Chr(13));
  return returnValue;
}
</cfscript>