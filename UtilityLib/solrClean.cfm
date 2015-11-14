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
 * Like VerityClean, massages text input to make it Solr compatible.
 * v1.0 by Sami Hoda
 * v2.0 by Daria Norris to deal with wildcard characters used as the first letter of the search
 * v2.1 by Paul Alkema - updated list of characters to escape
 * v2.2 by Adam Cameron - Merge Paul's &amp; Daria's versions of the function, improve some regexes, fix logic error with input argument (was both required and had a default), converted wholly to script
 * 
 * @param input 	 String to run against (Required)
 * @return Returns a string. 
 * @author Sami Hoda (sami@bytestopshere.com) 
 * @version 2.2, October 2, 2012 
 */
string function solrClean(required string input){
	var cleanText = trim(arguments.input);
	// List of bad charecters. "+ - && || ! ( ) { } [ ] ^ " ~ * ? : \" 
	// http://lucene.apache.org/core/3_6_0/queryparsersyntax.html#Escaping Special Characters
	var reBadChars = "\+|-|&&|\|\||!|\(|\)|{|}|\[|\]|\^|\""|\~|\*|\?|\:|\\";
	
	// Replace comma with OR
	cleanText = replace(cleanText, "," , " or " , "all");

	// Strip bad characters
	cleanText = reReplace(cleanText, reBadChars, " ", "all");

	// Clean up sequences of space characters
	cleanText = reReplace(cleanText, "\s+", " ", "all");

    // clean up wildcard characters as first characters
    cleanText = reReplace(cleanText, "(^[\*\?]{1,})", "");

	// uCaseWords - and=AND, etc - lcase rest. if keyword is mixed case - solr treats as case-sensitive!
	cleanText = uCaseWordsForSolr(cleanText);
	return trim(cleanText);
}
</cfscript>