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
 * Returns as a binary object the chr by chr XOR of two given strings for length of shortest of the two.
 * 
 * @param str1 	 First string. (Required)
 * @param str2 	 Second string. (Required)
 * @return Returns a binary string. 
 * @author Peter Day (JWVPICBHZCOX@spammotel.com) 
 * @version 1, December 1, 2006 
 */
function strXOR(str1,str2) {
	var theXOR="";
	var minLen=min(len(str1),len(str2)); 
	var i=1;
	
	for (; i le minLen; i=i+1 ) {
		theXOR = theXOR & rJustify(formatbaseN(bitXor(asc(mid(str1,i,1)),asc(mid(str2,i,1))),"16"),2);
	}
	
	theXOR=binaryDecode(replaceNoCase(theXOR," ","0","all"),"hex");
	return theXOR;
}
</cfscript>