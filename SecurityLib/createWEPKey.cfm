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
 * Creates a 40-bit or 128-bit WEP key.
 * 
 * @param length 	 Length of the WEP key. Either 40 or 128 (default). (Optional)
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, January 12, 2006 
 */
function createWEPKey() {
	var baseKey = "";
	var key = "";
	var defaultLength = 128;
	var length = defaultLength;
	
	/* If user has passed in a specfic key length, and they want a 40-bit key,
	change the value of length to 40 instead of 128.
	Of course, a 40-bit WEP key is trivial to crack, but that is not my problem. */
	if (arrayLen(arguments) eq 1) {
		if(val(arguments[1]) eq 40)
			length = 40;
	}
	
		
	/* 
		CF generated UUIDs look like this:
		73B96C47-F5F1-0F5C-488C7C5170101FA0
		8 chars - 4 chars - 4 chars - 16 chars
		
		First off, generate a base key
	*/
	baseKey = mid(createUUID(),20,16) & mid(createUUID(),15,4) & mid(createUUID(),10,4) & mid(createUUID(),25,2);
	
	/* Create a 40-bit or 128-bit key, as the user requested */
	switch(length) {
		case "40": {
			key = mid(baseKey,10,10);
			break;
		}
		case "128": {
			key = baseKey;
			break;
		}
	} //end switch
	
	return key;
}
</cfscript>