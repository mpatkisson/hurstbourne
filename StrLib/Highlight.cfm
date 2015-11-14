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
 * Applies a simple highlight to a word in a string.
 * Original version by Raymond Camden.
 * 
 * @param string 	 The string to format. (Required)
 * @param word 	 The word to highlight. (Required)
 * @param front 	 This is the HTML that will be placed in front of the highlighted match. It defaults to <span style= (Optional)
 * @param back 	 This is the HTML that will be placed at the end of the highlighted match. Defaults to </span> (Optional)
 * @param matchCase 	 If true, the highlight will only match when the case is the same. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author Dave Forrest (dmf67@yahoo.com) 
 * @version 2, June 12, 2003 
 */
function highLight(source,lookfor) {
	var tmpOn       = "[;;^";
	var tmpOff      = "^;;]";
	var hilightitem	= "<SPAN STYLE=""background-color:yellow;"">";
	var endhilight  = "</SPAN>";
	var matchCase   = false;
	var obracket    = "";
	var tmps		= "";
	var stripperRE  = "";
	var badTag		= "";
	var nextStart	= "";
	
	if(ArrayLen(arguments) GTE 3) hilightitem = arguments[3];
	if(ArrayLen(arguments) GTE 4) endhilight  = arguments[4];
	if(ArrayLen(arguments) GTE 5) matchCase   = arguments[5];
	if(NOT matchCase) 	source = REReplaceNoCase(source,"(#lookfor#)","#tmpOn#\1#tmpOff#","ALL");
	else 				source = REReplace(source,"(#lookfor#)","#tmpOn#\1#tmpOff#","ALL");
	obracket   = find("<",source);
	stripperRE = "<.[^>]*>";	
	while(obracket){
		badTag = REFindNoCase(stripperRE,source,obracket,1);
		if(badTag.pos[1]){
			tmps 	  = Replace(Mid(source,badtag.pos[1],badtag.len[1]),"#tmpOn#","","ALL");
			source 	  = Replace(source,Mid(source,badtag.pos[1],badtag.len[1]),tmps,"ALL");
			tmps 	  = Replace(Mid(source,badtag.pos[1],badtag.len[1]),"#tmpOff#","","ALL");
			source 	  = Replace(source,Mid(source,badtag.pos[1],badtag.len[1]),tmps,"ALL");
			nextStart = badTag.pos[1] + badTag.len[1];
		}
		else nextStart = obracket + 1;
		obracket = find("<",source,nextStart);
	}
	source = Replace(source,tmpOn,hilightitem,"ALL");
	source = Replace(source,tmpOff,endhilight,"ALL");
	return source;
}
</cfscript>