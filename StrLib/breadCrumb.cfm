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
 * Creates a bread crumb trail based on your sites sirectory structure.
 * 
 * @return Returns a string. 
 * @author Jon Lesser (jdl1101@rit.edu) 
 * @version 1, July 25, 2006 
 */
function breadCrumb() {
	var baseLink = "/";
	var delimiter = " > ";
	var crumbs = "<a href='" & baseLink & "'>Home</a>" & delimiter;
	var breadCrumbArray = listToArray(replace(cgi.script_name, "_", " ", "all") , "/");
	var i = 1;
	
	for(i=1; i lt arrayLen(breadCrumbArray); i=i+1) {
		baseLink = baseLink & replace(breadCrumbArray[i], " ", "_", "all") & "/";
		
		if(i lt ArrayLen(breadCrumbArray)-1) crumbs = crumbs & "<a href='" & baseLink & "'>" & capFirstTitle(breadCrumbArray[i]) & "</a>" & delimiter;
		else crumbs = crumbs & capFirstTitle(breadCrumbArray[i]);		
	}
	return crumbs;
}
</cfscript>