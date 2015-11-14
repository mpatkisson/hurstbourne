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
 * Cleanly converts typewriter quotes to typographer's quotes.
 * 
 * @param txt 	 Text to format. (Required)
 * @return Returns a string. 
 * @author Keith Gaughan (kmgaughan@eircom.net) 
 * @version 1, May 1, 2006 
 */
function magicQuote(txt) {
    // Left quotes
    txt = REReplace(txt, "(^|[ " & Chr(9) & Chr(10) & Chr(13) & "'])""", "\1&##8220;", "ALL");
    txt = REReplace(txt, "(^|[ " & Chr(9) & Chr(10) & Chr(13) & "]|&##8220;)'",  "\1&##8216;", "ALL");

    // Right quotes
    txt = Replace(txt, """",        "&##8221;",  "ALL");
    txt = Replace(txt, "'&##8220;", "'&##8221;", "ALL");
    txt = Replace(txt, "'",         "&##8217;",  "ALL");

    return txt;
}
</cfscript>