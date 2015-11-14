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
 * Returns the date the file was last modified.
 * v2 fixes for DTS by Mark Woods (mwoods@online.ie)
 * 
 * @param filename 	 Name of the file. (Required)
 * @return Returns a date. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 1, June 11, 2009 
 */
function FileLastModified(filename){
	var oFile = createObject("java","java.io.File");
	var oDate = createObject("java","java.util.Date");
	oFile.init(fileName);
	return oDate.init(oFile.lastModified());
}
</cfscript>