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
 * Returns TRUE if the string is a valid IP address.
 * 
 * @param string 	 String to be checked. 
 * @return Returns a boolean. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, July 17, 2001 
 */
function isIP(ip){
	var ii = 1;
	//make sure it is a '.' delimited list 4 long
	if(listlen(ip,".") is not 4) return false;

	//make sure each item is a number between 1 and 255
	for(ii = 1;ii lte 4;ii = ii + 1){
		if(not isnumeric(listgetat(ip,ii,".")) OR listgetat(ip,ii,".") GT 255 OR listgetat(ip,ii,".") LT 0)	return false;
	}
	//check for the special cases of 255.255.255.255 or 0.0.0.0, which is not really valid
	if(ip is "255.255.255.255" OR IP is "0.0.0.0") return false;
	return true;
}
</cfscript>