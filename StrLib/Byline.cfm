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
 * Generates a byline from a list of names.
 * 
 * @param names 	 List of Names. (Required)
 * @param editors 	 Boolean signifying that the list is a list of editors. Defaults to false. (Optional)
 * @param extrasMode 	 String signifying extrasMode to use. Currently "IMDB" is support. Defaults to "none". (Optional)
 * @return Returns a string. 
 * @author Gyrus (gyrus@norlonto.net) 
 * @version 1, October 10, 2002 
 */
function Byline(names) {
	// Initialise
	var i = 0;
	var name = "";
	var bylineString = "";
	var edited = FALSE;
	var extrasMode = "none";
	if (ArrayLen(Arguments) GT 1) {
		edited = Arguments[2];
	}
	if (ArrayLen(Arguments) GT 2) {
		extrasMode = Arguments[3];
	}
	// Loop through names
	if (ListLen(names)) {
		for (i=1; i LTE ListLen(names); i=i+1) {
			name = ListGetAt(names, i);
			// Edited?
			if (edited) {
				name = "#name# (ed.)";
			}
			// Perform extras
			switch (extrasMode) {
				case "imdb": {
					name = "<a href=""http://uk.imdb.com/Name?#Replace(name,' ','+','ALL')#"" title=""check for information on this person on the Internet Movie Database"">#name#</a>";
					break;
				}
			}
			if (i EQ 1) {
				bylineString = "by #name#";
			} else if (i EQ ListLen(names)) {
				bylineString = "#bylineString# &amp; #name#";
			} else {
				bylineString = "#bylineString#, #name#";
			}
		}
	}
	return bylineString;
}
</cfscript>