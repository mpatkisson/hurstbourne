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
 * Create a new file.
 * 
 * @param filename 	 Filename to create. (Required)
 * @param force 	 Force creation (will nuke existing file). Defaults to false. (Optional)
 * @return Returns nothing. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 1, February 20, 2003 
 */
function FileCreate(filename){
	var force = false;
	var daFile = createObject('java', 'java.io.File');
	
	if(arraylen(arguments) gte 2) force = arguments[2];
	daFile.init(JavaCast('string', filename));
	if(force) daFile.delete();
	daFile.createNewFile();
}
</cfscript>