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
 * Finds all anchor or frame tags and creates a structure that you can use to look up a URL by name.
 * 
 * @param BodyText 	 String to parse. (Required)
 * @return Returns a structure of matches. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, February 21, 2011 
 */
function getLinks(BodyText){
	var objLinks = StructNew();
	var objIndex = StructNew();
	var arrLink = ArrayNew(1);
	var arrDesc = ArrayNew(1);
	var nextMatch = 1;
	var Counter = 1;
	do { /* find opening anchor tag. */
		objMatch = REFindNoCase("<(A|FRAME)[[:space:]]+[^>]*(HREF|SRC) ?= ?[""']?([^[:space:]""'>]+)(>|(([""']|[[:space:]])[^>]*>))", BodyText, nextMatch, true);
		nextMatch = objMatch.pos[1] + objMatch.len[1];
		if (ArrayLen(objMatch.pos) GTE 4) {
			thisURL = Mid(BodyText, objMatch.pos[4], objMatch.len[4]);
			thisTag = Mid(BodyText, objMatch.pos[2], objMatch.len[2]);
			if (CompareNoCase(thisTag, "A") EQ 0) {
				descEnd = FindNoCase("</A>", BodyText, nextMatch);
				thisDesc = Mid(BodyText, nextMatch, descEnd - nextMatch);
				nextMatch = descEnd + 4;
			} else { /* get the frame name */
				fullTag = Mid(BodyText, objMatch.pos[1], objMatch.len[1]);
				frameName = "";
				objFrame = REFindNoCase("NAME ?= ?[""']?([^[:space:]""'>]+)(>|(([""']|[[:space:]])[^>]*>))", fullTag, 1, true);
				if (ArrayLen(objFrame.pos) GT 1) {
					frameName = Mid(fullTag, objFrame.pos[2], objFrame.len[2]);
				}
				thisDesc = "FRAME: " & frameName;
			}
			StructInsert(objIndex, thisDesc, Counter, true);
			arrLink[Counter] = thisURL;
			arrDesc[Counter] = thisDesc;
			Counter = Counter + 1;
		}
	} while (nextMatch NEQ 0);
	StructInsert(objLinks, "index", objIndex);
	StructInsert(objLinks, "link", arrLink);
	StructInsert(objLinks, "desc", arrDesc);
	return objLinks;
}
</cfscript>