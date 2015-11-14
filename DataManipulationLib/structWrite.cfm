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
 * Like structInsert() but does not throw an error if the key exists and you choose not to overwrite.
 * 
 * @param structure 	 Struct to be modified. (Required)
 * @param key 	 Key to modify. (Required)
 * @param value 	 Value to use. (Required)
 * @param allowOverwrite 	 Boolean. If false and key exists, value will not be changed. Defaults to false. (Optional)
 * @return Returns yes or no indicating if a change was made. 
 * @author Anthony Cooper (ant@bluevan.co.uk) 
 * @version 1, May 9, 2003 
 */
function structWrite(structure, key, value) {
	var valueWritten = false;
	var allowOverwrite = false;
		
	if(arrayLen(arguments) gte 4) allowOverwrite = arguments[4];

	if ( structKeyExists( structure, key ) IMP allowOverwrite ) {
		valueWritten = structInsert( structure, key, value, allowOverwrite );
	}
	return yesNoFormat(valueWritten);
}
</cfscript>