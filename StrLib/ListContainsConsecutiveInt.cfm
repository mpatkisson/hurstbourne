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
 * Determines if a list consists of consecutive integers, regardless or order.
 * 
 * @param lsIncoming 	 List to check. (Required)
 * @param strDelimiter 	 Delimiter for the list. Defaults to a comma. (Optional)
 * @return Returns a boolean. 
 * @author Teri Stewart (terilynnstewart@hotmail.com) 
 * @version 1, May 9, 2003 
 */
function ListContainsConsecutiveInt(lsIncoming){
  var arrSorted=ArrayNew(1);
  var i=0;
  var strDelimiter=",";

 //default list delimiter to a comma unless otherwise specified
 if(ArrayLen(arguments) gte 2){
  strDelimiter=arguments[2];
 }
  //change list to array for faster processing
  arrSorted=ListToArray(lsIncoming,strDelimiter);
  //make sure all array elements are numeric and itegers
  for(i=1; i lte ArrayLen(arrSorted); i=i+1){
    if(not isNumeric(arrSorted[i]) or round(arrSorted[i]) is not arrSorted[i]){
      return false;
    }
  }
  //sort the array
  arraySort(arrSorted,"numeric");
  //loop sorted array
  for(i=0; i lt ArrayLen(arrSorted); i=i+1){
    //see if item at array position i+1 equals the first array element + i
    if(arrSorted[i+1] neq arrSorted[1]+i){
      return false;
      break;
    }
  }
  return true;
}
</cfscript>