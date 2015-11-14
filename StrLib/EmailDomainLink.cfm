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
 * Formats an e-mail address so that its domain is a link to its web site.
 * 
 * @param theEmailAddress 	 Email address. (Required)
 * @param theTarget 	 Optional target for new window. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, September 29, 2003 
 */
function emailDomainLink(theEmailAddress) {
	var this_username  = listFirst(theEmailAddress, "@");
	var this_domain    = listLast(theEmailAddress, "@");
	var theTarget      = "";
	if(arrayLen(arguments) gte 2) theTarget = arguments[2];
	if(Len(theTarget) GT 0) return "#this_username#@<a href=""http://www.#this_domain#"" target=""#theTarget#"">#this_domain#</a>";
	else return "#this_username#@<a href=""http://www.#this_domain#"">#this_domain#</a>";
}
</cfscript>