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
 * Extract all occurrences of a given tag pair from a string.
 * 
 * @param tag 	 Tag to look for. Do not include brackets. (Required)
 * @param str 	 String to parse. (Required)
 * @return Returns an array. 
 * @author Todd Sharp (todd@cfsilence.com) 
 * @version 1, October 24, 2008 
 */
function getTagContentAll(tag,str) {
	var matchStruct = structNew();
	var matchPos = "";
	var matchLen = "";
	var startTag = "<#lcase(tag)#";
	var endTag = "</#tag#>";
	var endTagStart = 0;
	var firstOcc = REFindNoCase(startTag,str,1,true);
	var returnArray = ArrayNew(1);

	//check the char following the tag - if it closes the tag then set the startTag accordingly
	if(mid(str, firstOcc.pos[1]+len(startTag),1) eq ">") {
		startTag = "<#tag#>";
	} else {
	//there are attributes so the RE should accommodate
	//include a space following the tag name so that searching
	//for 'b' does not find 'b' and 'body', etc
	startTag = "<#tag# [^>]*>";
	}

	matchStruct = REFindNoCase(startTag,str,1,"true");
	matchPos = matchStruct.pos [1];
	matchLen = matchStruct.len[1];
	
	if(matchLen eq 0) return returnArray;
	endTagStart = REFindNoCase(endTag,str,matchPos,"false");
	//if no end tag exists return out
	if(endTagStart eq 0) return returnArray;

	ArrayAppend(returnArray,Mid(str,matchPos+matchLen,endTagStart-matchPos-matchLen));

	while (matchLen neq 0) {
		matchStruct = REFindNoCase(startTag,str,matchPos+matchLen,"true");
		matchPos = matchStruct.pos [1];
		matchLen = matchStruct.len[1];
		if(matchLen eq 0) return returnArray;
		endTagStart = REFindNoCase(endTag,str,matchPos,"false");
		ArrayAppend(returnArray,Mid(str,matchPos+matchLen,endTagStart-matchPos-matchLen));
	}

	return returnArray;
}
</cfscript>