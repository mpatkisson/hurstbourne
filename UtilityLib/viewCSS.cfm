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
 * Returns a visual representation of stylesheet elements.
 * 
 * @param cssCode 	 CSS to parse. (Required)
 * @return Returns a string. 
 * @author Shlomy Gantz (shlomy@bluebrick.com) 
 * @version 1, December 20, 2005 
 */
function viewCSS(cssCode) {
	var i ="";
	var cssItem="";
	var ret="";
	for(i=1;i lte listlen(arguments.cssCode,'}');i=i+1) {
		cssItem = listgetAt(arguments.cssCode,i,'}');
		if(findNocase('{',cssItem)) ret = ret & '<div style="#trim(mid(cssItem,findNocase("{",cssItem)+1,len(cssItem)))#">#trim(mid(cssItem,1,findNocase("{",cssItem)-1))#</div><br>';
	}
	return ret;
}
</cfscript>