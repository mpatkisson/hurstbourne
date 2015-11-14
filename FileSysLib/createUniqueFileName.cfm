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
 * Creates a unique file name; used to prevent overwriting when moving or copying files from one location to another.
 * v2, bug found with dots in path, bug found by joseph
 * v3 - missing dot in extension, bug found by cheesecow
 * 
 * @param fullpath 	 Full path to file. (Required)
 * @return Returns a string. 
 * @author Marc Esher (marc.esher@cablespeed.com) 
 * @version 3, July 1, 2008 
 */
function createUniqueFileName(fullPath){
    var extension = "";
    var thePath = "";
    var newPath = arguments.fullPath;
    var counter = 0;
    
    if(listLen(arguments.fullPath,".") gte 2) extension = listLast(arguments.fullPath,".");
    thePath = listDeleteAt(arguments.fullPath,listLen(arguments.fullPath,"."),".");

    while(fileExists(newPath)){
        counter = counter+1;        
        newPath = thePath & "_" & counter & "." & extension;            
    }
    return newPath;    
}
</cfscript>