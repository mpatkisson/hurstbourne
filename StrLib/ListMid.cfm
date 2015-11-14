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
 * A Mid() function for lists.  Returns n elements starting at the specified start position.
 * 3/25/02: Removed a line of extraneous code.
 * 4/11/02: Fixed problem with going past end of list.
 * 
 * @param list 	 List you want to return the elements from. 
 * @param startPos 	 Starting position in the list to begin returning from. 
 * @param numElements 	 Number of elements you want returned. 
 * @param delimiter 	 Delimiter for the list.  Default is the comma. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.1, April 11, 2002 
 */
function ListMid(list, startPos, numElements){
  var tempList="";
  var i=0;
  var delimiter=",";
  var finish = startPos+numElements;
  if (ArrayLen(arguments) gt 3)
    delimiter = arguments[4];
  if (startPos+numElements gt ListLen(list, delimiter))
    finish = ListLen(list, delimiter)+1;
  for (i=startPos; i LT finish; i=i+1){
    tempList=ListAppend(tempList, ListGetAt(list, i, delimiter), delimiter);
  }
  return tempList;
}
</cfscript>