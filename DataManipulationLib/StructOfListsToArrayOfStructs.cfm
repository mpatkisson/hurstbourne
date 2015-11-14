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
 * Converts a structure of Lists to an Array of structures.
 * 
 * @param struct 	 Struct of lists. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @param cols 	 Struct keys to use. Defaults to all. (Optional)
 * @return Returns an array. 
 * @author Casey Broich (cab@pagex.com) 
 * @version 1, August 2, 2003 
 */
function StructOfListsToArrayOfStructs(Struct){
   var delim = ",";
   var theArray = arraynew(1);
   var row = 1;
   var i = ""; 
   var cols = structkeyarray(Struct);
   var count = 0;
   var value = ""; 
   var strow = "";

   if(arrayLen(arguments) GT 1) delim = arguments[2];
   if(arrayLen(arguments) GT 2) cols = listToArray(arguments[3]);
   count = listlen(struct[cols[1]],delim);
   if(arraylen(cols) gt 0) {
      for(row=1; row LTE count; row = row + 1){
      strow = structnew();
      for(i=1; i lte arraylen(cols); i=i+1) {
         if(structKeyExists(Struct,cols[i])){
            if(listlen(Struct[cols[i]],delim) gte row){
               value = listgetat(Struct[cols[i]],row,delim);
            }else{
               value = "";
            }
         }else{
            value = "";
         }
         strow[cols[i]] = value;
      }
      arrayAppend(theArray,strow);
      }
   }
   return theArray;
}
</cfscript>