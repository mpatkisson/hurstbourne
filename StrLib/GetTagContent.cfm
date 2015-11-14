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
 * Returns the content enclosed in a tag pair.
 * 
 * @param tag 	 The tag to look for. Should be passed without < or > and without attributes. (Required)
 * @param string 	 The string to search. (Required)
 * @return Returns a string. 
 * @author Johan Steenkamp (johan@orbital.co.nz) 
 * @version 1, September 16, 2002 
 */
function getTagContent(tag,str) {
	var matchStruct = structNew();
	var startTag = "<#tag#[^>]*>";
	var endTag = "</#tag#>";
	var endTagStart = 0;
	matchStruct = REFindNoCase(startTag,str,1,"true");
	if(matchStruct.len[1] eq 0 ) return ""; 
	endTagStart = REFindNoCase(endTag,str,matchStruct.pos[1],"false");
	return Mid(str,matchStruct.pos[1]+matchStruct.len[1],endTagStart-matchStruct.pos[1]-matchStruct.len[1]);
}
</cfscript>