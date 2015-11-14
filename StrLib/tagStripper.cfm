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
 * Function to strip HTML tags, with options to preserve certain tags.
 * v2 by Ray Camden, fix to closing tag
 * 
 * @param str 	 String to manipulate. (Required)
 * @param action 	 Strip or preserve. Default is strip. (Optional)
 * @param tagList 	 Tags to strip or perserve. (Optional)
 * @return Returns a string. 
 * @author Rick Root (rick@webworksllc.com) 
 * @version 2, July 2, 2008 
 */
function tagStripper(str) {
	var i = 1;
	var action = 'strip';
	var tagList = '';
	var tag = '';
	
	if (ArrayLen(arguments) gt 1 and lcase(arguments[2]) eq 'preserve') {
		action = 'preserve';
	}
	if (ArrayLen(arguments) gt 2) tagList = arguments[3];

	if (trim(lcase(action)) eq "preserve") {
		// strip only those tags in the tagList argument
		for (i=1;i lte listlen(tagList); i = i + 1) {
			tag = listGetAt(tagList,i);
			str = REReplaceNoCase(str,"</?#tag#.*?>","","ALL");
		}
	} else {
		// strip all, except those in the tagList argument
		// if there are exclusions, mark them with NOSTRIP
		if (tagList neq "") {
			for (i=1;i lte listlen(tagList); i = i + 1) {
				tag = listGetAt(tagList,i);
				str = REReplaceNoCase(str,"<(/?#tag#.*?)>","___TEMP___NOSTRIP___\1___TEMP___ENDNOSTRIP___","ALL");
			}
		}
		// strip all remaining tsgs.  This does NOT strip comments
		str = reReplaceNoCase(str,"</{0,1}[A-Z].*?>","","ALL");
		// convert unstripped back to normal
		str = replace(str,"___TEMP___NOSTRIP___","<","ALL");
		str = replace(str,"___TEMP___ENDNOSTRIP___",">","ALL");
	}
	
	return str;	
}
</cfscript>