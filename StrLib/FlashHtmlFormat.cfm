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
 * Converts a string into &quot;Flash&quot; safe HTML.
 * 
 * @param text 	 Text to be converted. (Required)
 * @return Returns a string. 
 * @author William Steiner (williams@hkusa.com) 
 * @version 1, September 15, 2003 
 */
function FlashHTMLFormat(someText) {
	var returnText = someText;
	var listCount = 0;
	returnText = ReplaceNoCase(returnText, "#Chr(10)#", "", "ALL");
	returnText = ReplaceNoCase(returnText, "<OL></OL>", "", "ALL");
	returnText = StripCR(returnText);

	while (FindNoCase('<OL>', returnText) neq 0) {
		while ((FindNoCase('</OL>', returnText) gt FindNoCase('<li>', returnText)) AND (FindNoCase('<li>', returnText) neq 0)) {
			startSearchAt = FindNoCase('<OL>', returnText);
			listCount = listCount + 1;
			// replaces the next <li> with the correct number.
			if (listCount gt 9)
				returnText = ReplaceNoCase(returnText, "<li>", "<BR>  #listCount#.  ");
			else
				returnText = ReplaceNoCase(returnText, "<li>", "<BR>    #listCount#.  ");
		}
		// we are done with that list, get rid of the <ol> tag so we can find the next 
		listCount = 0;
		returnText = ReplaceNoCase(returnText, "<OL>", "<br>", "one"); 
		returnText = ReplaceNoCase(returnText, "</OL>", "<br><br>", "one"); 
	}
	
	returnText = ReplaceNoCase(returnText, "<LI>", "<br>", "ALL"); 
	// Step xx, get rid of ALL </li>, </ol>, and </ul> tags
	returnText = ReplaceNoCase(ReplaceNoCase(ReplaceNoCase(returnText, "</li>", "", "ALL"), "</ol>", "<br><br>", "ALL"), "</ul>", "<br><br>", "ALL");
	// Step xx, REReplace statement changes the color attribute of the font tag to have
	// quotes around it...ActiveEdit strips them out :(
	returnText = REReplaceNoCase(returnText, "<FONT color=(#Chr(35)#[A-Za-z0-9]*)></FONT>", "", "ALL");
	returnText = REReplaceNoCase(returnText, "target=([A-Za-z0-9_]*)", "target=#Chr(34)#\1#Chr(34)#", "ALL");
	returnText = REReplaceNoCase(returnText, "face=([A-Za-z0-9_ ]*)", "face=#Chr(34)#\1#Chr(34)#", "ALL");
	returnText = REReplaceNoCase(returnText, "color=(#Chr(35)#[A-Za-z0-9]*)", "color=#Chr(34)#\1#Chr(34)#", "ALL");
	returnText = REReplaceNoCase(returnText, "size=([A-Za-z0-9]*)", "size=#Chr(34)#\1#Chr(34)#", "ALL");
	returnText = ReplaceNoCase(returnText, "&nbsp;", " ", "ALL");
	returnText = ReplaceNoCase(returnText, "&##39;", "'", "ALL");
	returnText = ReplaceNoCase(returnText, "'", "'", "ALL");
	returnText = ReplaceNoCase(returnText, "'", "'", "ALL");
	returnText = ReplaceNoCase(returnText, """", "#Chr(34)#", "ALL");
	returnText = ReplaceNoCase(returnText, """", "#Chr(34)#", "ALL");
	returnText = ReplaceNoCase(returnText, "<EM>", "<I>", "ALL");
	returnText = ReplaceNoCase(returnText, "</EM>", "</I>", "ALL");
	returnText = ReplaceNoCase(returnText, "<STRONG>", "<B>", "ALL");
	returnText = ReplaceNoCase(returnText, "</STRONG>", "</B>", "ALL");
	return returnText;
}
</cfscript>