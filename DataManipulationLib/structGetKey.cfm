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
 * Returns a key value from the given struct, or a default value.
 * 
 * @param theStruct 	 The structure. (Required)
 * @param theKey 	 Key name. (Required)
 * @param defaultValue 	 Default value to use if key does not exist. (Required)
 * @return Returns a value. 
 * @author Adam Tuttle (j.adam.tuttle@gmail.com) 
 * @version 0, September 9, 2008 
 */
function structGetKey(theStruct, theKey, defaultVal){
	if (structKeyExists(arguments.theStruct, arguments.theKey)){
		return arguments.theStruct[arguments.theKey];
	}else{
		return arguments.defaultVal;
	}
}
</cfscript>