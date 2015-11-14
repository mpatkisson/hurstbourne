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

<!---
 Converts a camel-case or underscored var name to plain text.
 v2 mods by RCamden
 
 @param str 	 String to parse. (Required)
 @return Returns a string. 
 @author Tony Felice (sites@breckcomm.com) 
 @version 2, January 6, 2009 
--->
function varNameToText(str) {
	var words = "";
	var i = "";
	var output="";

	str = reReplace(str,"([.^[:upper:]])", " \1","all");
	str = reReplace(str,"([.^_])", " ","all");
	words = ListToArray(str, " ");	
	for(i=1; i LTE (ArrayLen(Words)); i=i+1){
		words[i] = ucase(mid(words[i],1, 1)) & mid(words[i],2, len(words[i])-1);
	}
	output = arrayToList(words, " ");		
	return output;
}