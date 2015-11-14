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
 * Unicode language translator ((UTF-8))
 * version 0.1 by Pyae Phyoe Shein
 * version 1.0 by Adam Cameron - code tidy &amp; return a value rather than output it.  Added support for sections, as per getProfileString(). Make function usage analogous to getProfileString()
 * 
 * @param iniPath 	 Full path to ini file to parse. (Required)
 * @param section 	 Section of the ini file to parse. (Optional)
 * @param entry 	 Entry within that section to return value of. (Optional)
 * @return Returns the value of the entry if found, otherwise an empty string 
 * @author Pyae Phyoe Shein (pyaephyoeshein@gmail.com) 
 * @version 1.0, July 24, 2012 
 */
function getProfileStringUTF8(iniPath, section, entry) {
	var iniFile		= "";
	var line		= "";
	var inSection	= false;

	section		= "[#section#]";
	
	try {
		iniFile = fileOpen(iniPath, "read", "UTF-8");
		line	= "";
		
		// scan the file for the section
		while (!fileIsEOF(iniFile)) {
			line = FileReadLine(iniFile);

			// keep track if we've found the correct section
			if (line == section){
				inSection = true;
				continue;
			}
			
			// if we're in the correct section and we find a match, we're done: return its value
			if (inSection && listFirst(line, "=") == entry){
				return listRest(line, "=");
			}
			
			// if we get to another section, then we didn't find the match: exit
			if (inSection && reFind("^\s*\[[^\]]+\]", line)){
				return "";
			}
		}
	}
	catch (any e){
		rethrow;
	}
	finally {
		fileClose(iniFile);
	}
	// we got to the end of the file and didn't find it
	return "";
}
</cfscript>