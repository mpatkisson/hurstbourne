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
 * Lower Case Structure Keys
 * version 1.0 by Steve 'Cutter' Blades
 * 
 * @param str 	 Struct to lower-case the keys of (Required)
 * @return Returns a struct with its keys lower-cased 
 * @author Steve 'Cutter' Blades (no.junk@cutterscrossing.com) 
 * @version 1, August 26, 2012 
 */
function LCaseStructKeys(str){
	var i = "";
	var tmp = {};
	for(i in str){
		if(isStruct(str[i])){
			str[i] = LCaseStructKeys(str[i]);
		}
		tmp[LCase(i)] = duplicate(str[i]);
	}
	return tmp;
}
</cfscript>