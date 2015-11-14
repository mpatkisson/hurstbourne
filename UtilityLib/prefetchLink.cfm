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
 * Creates the prefetch directive for Mozilla/Firefox browsers.
 * For more information on link prefetching see http://www.mozilla.org/projects/netlib/Link_Prefetching_FAQ.html#What_are_the_prefetching_hints
 * 
 * @param link 	 Link for prefetching. (Required)
 * @param title 	 Title for prefetched resource. (Optional)
 * @return Returns a string. 
 * @author Wayne Graham (wsgrah@wm.edu) 
 * @version 1, August 22, 2005 
 */
function prefetchLink(link){
	if(arrayLen(arguments) gte 2) return '<link rel="prefetch" href="#arguments.link#" title="#arguments[2]#" />';
	 return '<link rel="prefetch" href="#arguments.link#">';
}
</cfscript>