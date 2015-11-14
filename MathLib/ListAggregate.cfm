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
 * Turn a list of numbers into a summation sequence.
 * 
 * @param list 	 List of values you want to return a summation sequence for. 
 * @param delim 	 Delimiter used to separate list elements.  Default is the comma. 
 * @return Returns a string. 
 * @author Jesse Monson (jesse@ixstudios.com) 
 * @version 1, March 25, 2002 
 */
function listAggregate(list) {
  var a=1;
  var sum=0;
  var sumList="";
  var delims=",";
  if (arrayLen(arguments) gte 2) {
    delims = arguments[2];
  }
    for ( ;a lte listLen(list,delims);a=a+1) {
      sum = sum + val(listGetAt(list,a,delims));
      sumList = ListAppend(sumList,sum,delims);
    }
  return sumList;
}
</cfscript>