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
 * Converts a structure of arrays to a keyed structure of structs.
 * 
 * @param struct 	 Struct to examine. (Required)
 * @param theKey 	 Key in structure to use as new primary key. (Required)
 * @param cols 	 Keys from original structure to use. Defaults to all. (Optional)
 * @return Returns a struct. 
 * @author Casey Broich (cab@pagex.com) 
 * @version 1, August 2, 2003 
 */
function StructOfArraysToStructOfStructs(struct,thekey){ 
   var i = ""; 
   var ii = ""; 
   var new = structNew();
   var value = ""; 
   var cols = "";

   if(arrayLen(arguments) GT 2) cols = listToArray(arguments[3]);
   else cols = structkeyarray(struct); 

   for(i = 1; i lte arraylen(struct[thekey]); i = i + 1){
      new[struct[thekey][i]] = structNew();
      for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
      if(structKeyExists(struct,cols[ii])){
         value = struct[cols[ii]][i];
      }else{
         value = "";
      }
      new[struct[thekey][i]][cols[ii]] = value;
      }
   }
   return new;
}
</cfscript>