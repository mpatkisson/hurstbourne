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
 * Extracts the keys from a struct
 * v1.0 by Adam Cameron (thanks to Simon Baynes for code review)
 * 
 * @param struct 	 A structure to extract the keys from (Required)
 * @param parent 	 A prefix to apply to each key (Optional)
 * @return Returns an array of keys with their fully-qualified dotted paths 
 * @author Adam Cameron (adamcameroncoldfusion@gmail.com) 
 * @version 1.0, September 20, 2012 
 */
array function structToKeys(required struct struct, string parent=""){
	var result = [];
	for (var key in struct){
		var thisPath = listAppend(parent, key, ".");
		arrayAppend(result, thisPath);
		if (isStruct(struct[key])){
			result.addAll(structToKeys(struct[key], thisPath));
		}
	}
	return result;
}
</cfscript>