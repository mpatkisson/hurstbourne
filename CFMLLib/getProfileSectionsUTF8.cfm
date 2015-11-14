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
 * UTF8-aware implementation of getProfileSections()
 * * version 0.1 by Reinhard Jung
 * * version 1.0 by Adam Cameron - convert into single UDF &amp; mirror usage of getProfileSections()
 * * version 1.1 by Adam Cameron (with help from Simon Baynes).  Removing debug code; correcting fileClose() behaviour
 * 
 * @param iniPath 	 Full path to ini file to parse. (Required)
 * @return Struct keyed by profile section, the values being comma-delimited lists of section entries 
 * @author Reinhard Jung (reinhard.jung@gmail.com) 
 * @version 1, July 27, 2012 
 */
function getProfileSectionsUTF8(iniPath) {
	var iniFile			= "";
	var line			= "";
	var profileSections = structNew();
	var thisSection		= "";

	try {
		iniFile = fileOpen(iniPath, "read", "UTF-8");
		line	= "";
		
		while (!fileIsEOF(iniFile)) {
			line = FileReadLine(iniFile);

			findSection = reFind("^\s*\[([^\]]+)\]", line, 1, true);	// eg: [sectionName]
			if (arrayLen(findSection.pos) gt 1){	// we're in a section
				thisSection = mid(line, findSection.pos[2], findSection.len[2]);
				profileSections[thisSection] = "";
				continue;
			}

			if (listLen(line, "=")){	// ie: not empty
				profileSections[thisSection] = listAppend(profileSections[thisSection], listFirst(line, "="));
			}			
		}
	}
	finally {
		if (iniFile != ""){	// assuming it's not its default value, it's safe to assume it's a file handle
			fileClose(iniFile);
		}
	}
	return profileSections;
}
</cfscript>