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
 * Highlights words in a string that are found in a keyword list.
 * v0.9 by Simon Bingham.
 * v1.0 by Adam Cameron. Improved regex and added configurable highlighting.
 * 
 * @param str 	 The string to highlight. (Required)
 * @param keywords 	 The list of keywords to highlight within the string. (Required)
 * @param highlight 	 A struct containing keys for tag and attributes, These are used to highlight the keyword. Defaults to an EM tag. (Required)
 * @return Returns the string  with the keywords highlighted. 
 * @author Simon Bingham (me@simonbingham.me.uk) 
 * @version 1.0, September 29, 2012 
 */
string function highlightKeywords(required string str, required string keywords, struct highlight){
	var keyword		= "";
	var replacement	= "";
	
	param name="highlight.tag"			default="em";
	param name="highlight.attributes"	default="";
	
	for (var index=1; index <= listLen( arguments.keywords ); index++){
		keyword = listGetAt(arguments.keywords, index);
		replacement = "<#highlight.tag#";
		if (len(highlight.attributes)){
			replacement &= " #highlight.attributes#";
		}
		replacement &= ">" & keyword & "</#highlight.tag#>";

		arguments.str = reReplaceNoCase( arguments.str, "\b#keyword#\b", replacement, "all" );
	}
	return arguments.str;
}
</cfscript>