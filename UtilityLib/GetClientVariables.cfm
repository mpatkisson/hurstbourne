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
 * Function returns a structure of client variable.
 * 
 * @return Returns a structure. 
 * @author Robert Segal (rsegal@figleaf.com) 
 * @version 1, January 30, 2003 
 */
function getclientvariables() {
 var lclientvarlist = getclientvariableslist();
 var stclientvar = structnew();
 var i = 1;
 for(i=1;i lte listlen(lclientvarlist);i=i+1)
 structinsert(stclientvar,"#listgetat(lclientvarlist,i)#",evaluate("client.#listgetat(lclientvarlist,i)#"));
 return stclientvar;
}
</cfscript>