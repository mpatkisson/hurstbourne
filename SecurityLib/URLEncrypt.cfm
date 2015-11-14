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
 * Add security by encrypting and decrypting URL variables.
 * 
 * @param cQueryString 	 Query string to encrypt. (Required)
 * @param nKey 	 Key to use for encryption. (Required)
 * @return Returns an encrypted query string. 
 * @author Timothy Heald (theald@schoollink.net) 
 * @version 2, February 19, 2003 
 */
function urlEncrypt(queryString, key){
	// encode the string
	var uue = cfusion_encrypt(queryString, key);
        
	// make a checksum of the endoed string
	var checksum = left(hash(uue & key),2);
        
	// assemble the URL
	queryString = "/" & uue & checksum &"/index.htm";
		
	return queryString;
}
</cfscript>