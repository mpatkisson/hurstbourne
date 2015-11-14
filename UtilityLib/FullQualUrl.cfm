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
 * Replace relative url's with a fully qualified URL
 * 
 * @param mytext 	 The string to search. 
 * @param relpage 	 The page to qualify. 
 * @param FQHost 	 The fully qualified host. 
 * @return Returns a string. 
 * @author Ryan Thompson-Jewell (thompsonjewell.ryan@mayo.edu) 
 * @version 1, November 2, 2001 
 */
function FullQualUrl(mytext,RelPage,FQHost) {
	var tmp=rereplacenocase(mytext,"(href\=){1}([""|'| ]*)(/)*(#RelPage#){1}","\1\2#FQHost#/#RelPage#","ALL");
	return tmp;
}
</cfscript>