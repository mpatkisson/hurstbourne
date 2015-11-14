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
 * Function to set or clear a Windows file attribute (ReadOnly, Hidden, etc) for the specified file.
 * Uses COM. This is a Windows only funciton. Requires CFOBJECT be enabled in the CF Administrator.
 * 
 * @param sFilePath 	 Absolute or relative path to the specified file. 
 * @param sAttribute 	 Attribute you wish to set.  Options are: ReadOnly, Hidden, System, Archive. 
 * @param bOnOff 	 Boolean value indicating whether the attribute should be on (Yes) or off (No). 
 * @return Returns a Boolean value indicating whether the attribute was set. 
 * @author Nate Weiss (nate@nateweiss.com) 
 * @version 1, September 27, 2001 
 */
function SetFileAttribute(sFilePath, sAttribute, bOnOff) {
   var result = False;
   var fso = 0;
   var f = 0;
   var iListPosition = 0;
   var iFlagPosition = 0;
   
   if ( FileExists(sFilePath) ) {
     fso = CreateObject("COM", "Scripting.FileSystemObject");
     f = fso.GetFile(sFilePath);
     iListPosition = ListFindNoCase("ReadOnly,Hidden,System,Archive", sAttribute);
     
     if (iListPosition GT 0) {
       iFlagPosition = ListGetAt("0,1,2,5", iListPosition);
       f.attributes = BitMaskSet(f.attributes, IIF(bOnOff, 1, 0), iFlagPosition, 1);
       result = True;
     }
   }
  
   return result;
 }
</cfscript>