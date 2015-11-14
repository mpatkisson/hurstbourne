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

<!---
 Implementation of Hoare's Quicksort algorithm for sorting arrays of arbitrary items.
 Slight mods by RCamden (added var for comparison).
 Update my Mark Mandel to use List.addAll() functions.
 
 @param arrayToCompare 	 The array to be sorted. (Required)
 @param sorter 	 The comparison UDF. (Required)
 @return Returns a sorted array. 
 @author James Sleeman (james@innovativemedia.co.nz) 
 @version 3, January 15, 2012 
--->
<cffunction name="quickSort" hint="Implementation of quicksort" access="public" returntype="array" output="false">
       <cfargument name="arrayToCompare" hint="The array to compare" type="array" required="Yes">
       <cfargument name="sorter" hint="UDF for comparing items" type="any" required="Yes">
       <cfscript>
               var lesserArray  = ArrayNew(1);
               var greaterArray = ArrayNew(1);
               var pivotArray   = ArrayNew(1);
               var examine      = 2;
               var comparison = 0;

               pivotArray[1]    = arrayToCompare[1];

               if (arrayLen(arrayToCompare) LT 2) {
                       return arrayToCompare;
               }

               while(examine LTE arrayLen(arrayToCompare)){
                       comparison = arguments.sorter(arrayToCompare[examine], pivotArray[1]);
                       switch(comparison) {
                               case "-1": {
                                       arrayAppend(lesserArray, arrayToCompare[examine]);
                                       break;
                               }
                               case "0": {
                                       arrayAppend(pivotArray, arrayToCompare[examine]);
                                       break;
                               }
                               case "1": {
                                       arrayAppend(greaterArray, arrayToCompare[examine]);
                                       break;
                               }
                       }
                       examine = examine + 1;
               }

               if (arrayLen(lesserArray)) {
                       lesserArray  = quickSort(lesserArray, arguments.sorter);
               } else {
                       lesserArray = arrayNew(1);
               }

               if (arrayLen(greaterArray)) {
                       greaterArray = quickSort(greaterArray, arguments.sorter);
               } else {
                       greaterArray = arrayNew(1);
               }

               lesserArray.addAll(pivotArray);
               lesserArray.addAll(greaterArray);

               return lesserArray;
       </cfscript>
</cffunction>