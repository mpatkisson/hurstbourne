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
 * This function will return the length of a file or a directory.
 * Version 2 by Nathan Dintenfass
 * Version 3 by Nat Papovich
 * 
 * @param filename 	 The filename or directory path. (Required)
 * @return Returns a number. 
 * @author Jesse Houwing (j.houwing@student.utwente.nl) 
 * @version 3, July 11, 2006 
 */
function fileSize(pathToFile) {
	var fileInstance = createObject("java","java.io.File").init(toString(arguments.pathToFile));
	var fileList = "";
	var ii = 0;
	var totalSize = 0;

	//if this is a simple file, just return it's length
	if(fileInstance.isFile()){
	    return fileInstance.length();
	}
	else if(fileInstance.isDirectory()) {
		fileList = fileInstance.listFiles();
		for(ii = 1; ii LTE arrayLen(fileList); ii = ii + 1){
		    totalSize = totalSize + fileSize(fileList[ii]);
		}
		return totalSize; 
	}
	else
		return 0;
}
</cfscript>