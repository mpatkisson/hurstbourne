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
 * Blends all nested structs, arrays, and variables in a struct to another.
 * 
 * @param struct1 	 The first struct. (Required)
 * @param struct2 	 The second sturct. (Required)
 * @param overwriteflag 	 Determines if keys are overwritten. Defaults to true. (Optional)
 * @return Returns a boolean. 
 * @author Raymond Compton (usaRaydar@gmail.com) 
 * @version 2, October 30, 2008 
 */
function structBlend(Struct1,Struct2) {
	var i = 1;
	var OverwriteFlag = true;
	var StructKeyAr = listToArray(structKeyList(Struct2));
	var Success = true;
  	if ( arrayLen(arguments) gt 2 AND isBoolean(Arguments[3]) ) // Optional 3rd argument "OverwriteFlag"
  		OverwriteFlag = Arguments[3];
		try {
			for ( i=1; i lte structCount(Struct2); i=i+1 ) {
				if ( not isDefined('Struct1.#StructKeyAr[i]#') )  // If structkey doesn't exist in Struct1
					Struct1[StructKeyAr[i]] = Struct2[StructKeyAr[i]]; // Copy all as is.
				else if ( isStruct(struct2[StructKeyAr[i]]) )			// else if key is another struct
					Success = structBlend(Struct1[StructKeyAr[i]],Struct2[StructKeyAr[i]],OverwriteFlag);  // Recall function
				else if ( OverwriteFlag )	// if Overwrite
					Struct1[StructKeyAr[i]] = Struct2[StructKeyAr[i]];  // set Struct1 Key with Struct2 value.
			}
		}
		catch(any excpt) { Success = false; }
	return Success;
}
</cfscript>