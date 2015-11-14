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
 * Add security by encrypting and decrypting URL variables. See URLEncrypt.
 * Mod by David Heard - added decode
 * 
 * @param nKey 	 The encryption key to use. (Required)
 * @param QueryString 	 Defaults to CGI.Query_String (Optional)
 * @return Writes to the URL scope. 
 * @author Timothy Heald (theald@schoollink.net) 
 * @version 3, October 9, 2002 
 */
function urlDecrypt(key){
	var queryString = cgi.path_info;
	var scope = "url";
	var stuff = "";
	var oldcheck = "";
	var newcheck = "";
	var i = 0;
	var thisPair = "";
	var thisName = "";
	var thisValue = "";

	// see if a scope is provided if it is set it otherwise set it to url
	if(arrayLen(arguments) gt 1){
		scope = arguments[2];
	}

	if ((right(queryString,3) neq "htm") or (findNoCase("&",queryString) neq 0) or (findNoCase("=",queryString) neq 0)){
		stuff = '<FONT color="red">not encrypted, or corrupted url</FONT>';
	} else {
	
		// remove /index.htm
		querystring = replace(queryString, right(queryString,10),'');
		
		// remove the leading slash
		querystring = replace(queryString, left(queryString,1),'');
		
		// grab the old checksum
           if (len(querystring) GT 2) {
               oldcheck = right(querystring, 2);
               querystring = rereplace(querystring, "(.*)..", "\1");
           } 
           
           // check the checksum
           newcheck = left(hash(querystring & key),2);
           if (newcheck NEQ oldcheck) {
               return querystring;
           }
           
           //decrypt the passed value
		queryString = cfusion_decrypt(queryString, key);
		
			// set the variables
			for(i = 0; i lt listLen(queryString, '&'); i = i + 1){
				
				// Break up the list into seprate name=value pairs
				thisPair = listGetAt(queryString, i + 1, '&');
				
				// Get the name
				thisName = listGetAt(thisPair, 1, '=');
				
				// Get the value
				thisValue = listGetAt(thisPair, 2, '=');
				
				// Set the name with the scope
				thisName = scope & '.' & thisName;
				
				// Set the variable
				setVariable(thisName, thisValue);
			}
		
	}
	
	return stuff;
}
</cfscript>