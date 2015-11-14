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
 * Generates a mask for a short date based on the locale.
 * 
 * @param locale 	 The locale to use. Defaults to getLocale() (Optional)
 * @return Returns a string. 
 * @author matthew walker (matthew@cabbagetree.co.nz) 
 * @version 1, June 28, 2002 
 */
function ShortDateMask() {
	var Locale = GetLocale();
	var LocaleList = "Dutch (Belgian),Dutch (Standard),English (Australian),English (Canadian),English (New Zealand),English (UK),English (US),French (Belgian),French (Canadian),French (Standard),French (Swiss),German (Austrian),German (Standard),German (Swiss),Italian (Standard),Italian (Swiss),Norwegian (Bokmal),Norwegian (Nynorsk),Portuguese (Brazilian),Portuguese (Standard),Spanish (Mexican),Spanish (Modern),Spanish (Standard),Swedish";
	var MaskList = "d/mm/yyyy,d-m-yyyy,d/mm/yyyy,,dd/mm/yyyy,d/mm/yyyy,dd/mm/yyyy,m/d/yyyy,d/mm/yyyy,yyyy-mm-dd,dd/mm/yyyy,dd.mm.yyyy,dd.mm.yyyy,dd.mm.yyyy,dd.mm.yyyy,dd/mm/yyyy,dd.mm.yyyy,dd.mm.yyyy,dd.mm.yyyy,d/m/yyyy,dd-mm-yyyy,dd/mm/yyyy,dd/mm/yyyy,dd/mm/yyyy,yyyy-mm-dd";
	var ListPos = 0;
	if ( ArrayLen(Arguments) )
		Locale = Arguments[1]; 
	ListPos = ListFindNoCase(LocaleList, Locale);
	if ( ListPos )
		return ListGetAt(MaskList, ListPos);
	else 
		return "";	
}
</cfscript>