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
 * Displays n number of characters from a string without cutting off in the middle of a word
 * Code used from FullLeft
 * 
 * @param string 	 String to be modified. (Required)
 * @param number 	 Number of characters to include in teaser. (Required)
 * @param urlArgument 	 URL to use for 'more' link. (Optional)
 * @return Returns a string. 
 * @author Bryan LaPlante (blaplante@netwebapps.com) 
 * @version 3, July 31, 2003 
 */
function FormatTeaser(string,number){
	var urlArgument = "";
	var shortString = "";
	
	//return quickly if string is short or no spaces at all
	if(len(string) lte number or not refind("[[:space:]]",string)) return string;
	
	if(arrayLen(arguments) gt 2) urlArgument = "... <a href=""" & arguments[3] & """>[more]</a>";

	//Full Left code (http://www.cflib.org/udf.cfm?ID=329)
	if(reFind("[[:space:]]",mid(string,number+1,1))) {
	  	shortString = left(string,number);
	} else { 
		if(number-refind("[[:space:]]", reverse(mid(string,1,number)))) shortString = Left(string, (number-refind("[[:space:]]", reverse(mid(string,1,number))))); 
		else shortString = left(str,1);
	}
	
	return shortString & urlArgument;

}
</cfscript>