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
 * Given output from a cvs ls command, this UDF returns a list of files path-qualified for CVS.
 * 
 * @param cvsdir 	 List of files. (Required)
 * @param modulename 	 Second attribute. (Required)
 * @return Returns a string. 
 * @author Douglas Knudsen (doug@cubicleman.com) 
 * @version 1, October 14, 2008 
 */
function getAllFilesInModule(cvsdir, moduleName)	{
		var fileList = '';
		var curdir = arguments.moduleName;
		var myArray = ListToArray(arguments.cvsdir, chr(13));
		var myLength = ArrayLen(myArray);
		var temp = '';
		var i = 1;
		
		for( i = 1; i LTE myLength; i = i + 1)	{
			//WriteOutput(myArray[i] & '<br>');
			if(Find('Directory',myArray[i])) {
				curdir = Mid(myArray[i], Len('Directory ') + 1, Len(myArray[i])-Len('Directory '));
			}	else if(Trim(myArray[i]) NEQ '') {
				filelist = ListAppend(filelist, curdir & '/' & trim(myArray[i]) );
			}
			
		}
		return fileList;
	}
</cfscript>