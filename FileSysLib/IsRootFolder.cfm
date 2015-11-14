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
 * Returns True if the specified folder is the root folder. (Windows only)
 * 
 * @param path 	 Absolute or relative path to the specified folder. 
 * @return Returns a Boolean value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 23, 2001 
 */
function IsRootFolder(path)
{
  Var fso  = CreateObject("COM", "Scripting.FileSystemObject");
  Var folder = fso.Getfolder(path);
  Return folder.IsRootFolder;
}
</cfscript>