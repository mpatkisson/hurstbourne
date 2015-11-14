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
 * Is this IP within any of the IP ranges supplied.
 * 
 * @param sIP 	 The IP. (Required)
 * @param sIPREList 	 List of IP Regex strings. (Required)
 * @return Returns a boolean. 
 * @author Peter Crowley (pcrowley@webzone.ie) 
 * @version 1, April 14, 2005 
 */
function isIPInRange(sIP,sIPREList) {
	var i = 1;
	var nREListCount=ListLen(sIPREList);
	
	for (i = 1; i LTE nREListCount; i = i+1) {
		if (REFind(ListGetAt(sIPREList,i),sIP)) return true;
	}
	return false;
}
</cfscript>