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
 * Returns true/false if the current template is being called as a custom tag.
 * 
 * @return Returns a Boolean value. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, January 29, 2002 
 */
function IsCustomTag() {
  return yesNoFormat( listFindNoCase( getBaseTagList(), "CF_" & listFirst( listLast( getCurrentTemplatePath(), "/\" ), "." ) ) );
}
</cfscript>