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
 * UDF that returns an SEO friendly string.
 * Fix for - in front by B
 * 
 * @param title 	 String to modify. (Required)
 * @return Returns a string. 
 * @author Nick Maloney (nmaloney@prolucid.com) 
 * @version 2, November 29, 2008 
 */
function friendlyUrl(title) {
	title = replaceNoCase(title,"&amp;","and","all"); //replace &amp;
	title = replaceNoCase(title,"&","and","all"); //replace &
	title = replaceNoCase(title,"'","","all"); //remove apostrophe
	title = reReplaceNoCase(trim(title),"[^a-zA-Z]","-","ALL");
	title = reReplaceNoCase(title,"[\-\-]+","-","all");
	//Remove trailing dashes
	if(right(title,1) eq "-") {
		title = left(title,len(title) - 1);
	}
	if(left(title,1) eq "-") {
		title = right(title,len(title) - 1);
	}	
	return lcase(title);
}
</cfscript>