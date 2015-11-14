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
 * Counts the number of keys in a structure of structures.
 * Added missing return statement (rkc)
 * 
 * @param myStruct 	 The structure to examine. (Required)
 * @return Returns a numeric value. 
 * @author Galen Smallen (galen@oncli.com) 
 * @version 2, August 23, 2002 
 */
function deepStructCount(myStruct) {
    var deepCount=0;
    var x = "";
    var i = "";
        
    for (x in myStruct) { 
        if(isArray(myStruct[x])) {
            for(i=1; i lte arrayLen(myStruct[x]); i=i+1) {
                if(isStruct(myStruct[x][i])) deepCount = deepCount+deepStructCount(myStruct[x][i]);
            }
        } else if (isStruct(myStruct[x])) {
            deepCount=deepCount+deepStructCount(myStruct[x]);
        } else {
            deepCount=deepCount+1;
        }
    }
	return deepCount;
}
</cfscript>