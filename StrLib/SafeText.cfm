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
 * Removes potentially nasty HTML text.
 * Version 2 by Lena Aleksandrova - changes include fixing a bug w/ arguments and use of REreplace where REreplaceNoCase should have been used.
 * version 4 fix by Javier Julio - when a bad event is removed, remove the arg too, ie, remove onclick=&quot;foo&quot;, not just onclick.
 * 
 * @param text 	 String to be modified. (Required)
 * @param strip 	 Boolean value (defaults to false) that determines if HTML should be stripped or just escaped out. (Optional)
 * @param badTags 	 A list of bad tags. Has a long default list. Consult source. (Optional)
 * @param badEvents 	 A list of bad HTML events. Has a long default list. Consult source. (Optional)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 4, October 16, 2006 
 */
function safetext(text) {
	//default mode is "escape"
	var mode = "escape";
	//the things to strip out (badTags are HTML tags to strip and badEvents are intra-tag stuff to kill)
	//you can change this list to suit your needs
	var badTags = "SCRIPT,OBJECT,APPLET,EMBED,FORM,LAYER,ILAYER,FRAME,IFRAME,FRAMESET,PARAM,META";
	var badEvents = "onClick,onDblClick,onKeyDown,onKeyPress,onKeyUp,onMouseDown,onMouseOut,onMouseUp,onMouseOver,onBlur,onChange,onFocus,onSelect,javascript:";
	var stripperRE = "";
	
	//set up variable to parse and while we're at it trim white space 
	var theText = trim(text);
	//find the first open bracket to start parsing
	var obracket = find("<",theText);		
	//var for badTag
	var badTag = "";
	//var for the next start in the parse loop
	var nextStart = "";
	//if there is more than one argument and the second argument is boolean TRUE, we are stripping
	if(arraylen(arguments) GT 1 AND isBoolean(arguments[2]) AND arguments[2]) mode = "strip";
	if(arraylen(arguments) GT 2 and len(arguments[3])) badTags = arguments[3];
	if(arraylen(arguments) GT 3 and len(arguments[4])) badEvents = arguments[4];
	//the regular expression used to stip tags
	stripperRE = "</?(" & listChangeDelims(badTags,"|") & ")[^>]*>";	
	//Deal with "smart quotes" and other "special" chars from MS Word
	theText = replaceList(theText,chr(8216) & "," & chr(8217) & "," & chr(8220) & "," & chr(8221) & "," & chr(8212) & "," & chr(8213) & "," & chr(8230),"',',"","",--,--,...");
	//if escaping, run through the code bracket by bracket and escape the bad tags.
	if(mode is "escape"){
		//go until no more open brackets to find
		while(obracket){
			//find the next instance of one of the bad tags
			badTag = REFindNoCase(stripperRE,theText,obracket,1);
			//if a bad tag is found, escape it
			if(badTag.pos[1]){
				theText = replace(theText,mid(TheText,badtag.pos[1],badtag.len[1]),HTMLEditFormat(mid(TheText,badtag.pos[1],badtag.len[1])),"ALL");
				nextStart = badTag.pos[1] + badTag.len[1];
			}
			//if no bad tag is found, move on
			else{
				nextStart = obracket + 1;
			}
			//find the next open bracket
			obracket = find("<",theText,nextStart);
		}
	}
	//if not escaping, assume stripping
	else{
		theText = REReplaceNoCase(theText,stripperRE,"","ALL");
	}
	//now kill the bad "events" (intra tag text)
	theText = REReplaceNoCase(theText,'(#ListChangeDelims(badEvents,"|")#)[^ >]*',"","ALL");
	//return theText
	return theText;
}
</cfscript>