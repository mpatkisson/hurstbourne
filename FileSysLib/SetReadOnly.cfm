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
 * Convenience function to set/clear the ReadOnly attribute for the specified file.
 * Uses COM. This is a Windows only funciton. Requires CFOBJECT be enabled in the CF Administrator. This function depends on the SetFileAttribute() function in this library. See the SetFileAttribute() function for details.
 * 
 * @param sFilePath 	 Absolute or relative path to the specified file. 
 * @param bReadOnly 	 Boolean value indicating whether the attribute should be read only (Yes) or  (No). 
 * @return Returns a Boolean value indicating whether the attribute was set. 
 * @author Nate Weiss (nate@nateweiss.com) 
 * @version 1, September 27, 2001 
 */
function SetReadOnly(sFilePath, bReadOnly) {
   return setFileAttribute(sFilePath, "ReadOnly", bReadOnly);
 };
</cfscript>