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
 * Converts ini file(s) to a struct.
 * 
 * @param iniFiles 	 Array of ini files. (Required)
 * @return Returns a struct. 
 * @author Dave Anderson (the.one.true.dave.anderson@gmail.com) 
 * @version 0, April 26, 2012 
 */
public struct function iniToStruct(array iniFiles) {
	var config = {};
	for (local.f IN iniFiles) {
		local.inifile = fileExists(f) ? f : expandPath(f);
		local.sections = getProfileSections(local.iniFile); 
		for (local.k IN sections) {
			for (local.v IN listToArray(sections[k])) {
				config[k][v] = getProfileString(local.iniFile,k,v);
			}
		}
	}
	return config;
}
</cfscript>