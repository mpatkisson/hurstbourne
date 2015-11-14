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
 * Splits a URL into it's URL, QueryString, and Anchor parts.
 * 
 * @param inUrl 	 URL to parse. (Required)
 * @return Returns a struct. 
 * @author Samuel Neff (sam@serndesign.com) 
 * @version 1, January 12, 2004 
 */
function splitUrl(inUrl) {
	var s = inUrl;
	var refUrl = "";
	var refQS = "";
	var refAnchor = "";
	var st = structNew();
	var i = find("?", s);
	
	if (i) {
		refUrl = left(s, i-1);
		refQS = mid(s, i+1, 99999);
		i = find("##", refQS);
		if (i) {
			refAnchor = mid(refQS, i+1, 99999);
			refQS = left(refQS, i-1);
		} else {
		refAnchor = "";
		}
	} else {	
		i = find("##", s);
		if (i) {
			refUrl = left(s, i-1);
			refAnchor = mid(s, i+1, 99999);
		} else {
			refUrl = s;
		}
	}
	
	st.url = refUrl;
	st.queryString = refQS;
	st.anchor = refAnchor;
	
	return st;
}
</cfscript>