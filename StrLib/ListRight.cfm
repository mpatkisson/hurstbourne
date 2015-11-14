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
 * A Right() function for lists.  Returns the n rightmost elements from the specified list.
 * 
 * @param list 	 List you want to return the n rightmost elements from. 
 * @param numElements 	 Number of rightmost elements you want returned. 
 * @param delimiter 	 Delimiter for the list.  Default is the comma. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, April 24, 2002 
 */
function ListRight(list, numElements){
  var tempList="";
  var i=0;
  var delimiter=",";
  var totalLen=0;
  if (ArrayLen(arguments) gt 2){
    delimiter = arguments[3];
  }
  if (numElements gt ListLen(list, delimiter)){
    return list;
  }
  totalLen=ListLen(list, delimiter);
  for (i=(totalLen-numElements)+1; i LTE totalLen; i=i+1){
    tempList=ListAppend(tempList, ListGetAt(list, i, delimiter), delimiter);
  }
  return tempList;
}
</cfscript>