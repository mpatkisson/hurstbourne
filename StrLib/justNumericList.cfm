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
 * Filters a list so that just numeric entries are returned.
 * v2 changes by James Moberg
 * 
 * @param nList 	 List to filter. (Required)
 * @param strDelim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Raymond Camden (ray@camdenfamily.com) 
 * @version 2, April 1, 2010 
 */
function justNumericList(nList) {
   var intIndex = 0;
   var aryN = arrayNew(1);
   var strDelim = ",";
   var result = arrayNew(1);
   if (arrayLen(arguments) gte 2) strDelim = arguments[2];
   aryN = listToArray(nlist,strDelim);
   for (intIndex=1;intIndex LTE arrayLen(aryN);intIndex=intIndex+1) {
    if (not compare(val(aryN[intIndex]),aryN[intIndex])) arrayAppend(result, aryN[intIndex]);
   }
   return arrayToList(result,strDelim);
}
</cfscript>