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
 * Parse out the first set of numbers in a string.
 * 
 * @param string 	 String to parse. (Required)
 * @return Returns a string. 
 * @author Marco G. Williams (email@marcogwilliams.com) 
 * @version 1, May 22, 2003 
 */
function parseInt(String){
	var NewString = "";
	var i = 1;

	for(i=1; i lt Len(String); i = i + 1) {
		if( isNumeric( mid(String,i,1) ) ) { newString = val( mid( String,i,Len(String) ) ); break;}
	}
	return NewString;
}
</cfscript>