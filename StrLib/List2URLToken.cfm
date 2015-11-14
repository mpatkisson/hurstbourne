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
 * Converts a list into a QueryString. Allows an &quot;Exclude List&quot; as well.
 * 
 * @param fields 	 List of variables to loop over. (Required)
 * @param excluded 	 Variables to ignore. (Optional)
 * @param delim 	 Delimiter to use. Default is the comma. (Optional)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function List2UrlToken(fields){
	// Set Local Variables
	var token="";
	var excluded="";
	var delim=",";
	var i = 1;
	var tmpObj = "";
	
	if(arrayLen(arguments) gte 2) excluded = arguments[2];
	if(arrayLen(arguments) gte 3) delim = arguments[3];
	
	// Begin Processing
	for(i=1;i LTE listlen(fields,delim);i=i+1){
		if(not ListFind(excluded,listgetat(fields,i,delim))){
			tmpObj=listgetat(fields,i,delim);
			if(len(token)) token="#token#&#tmpObj#=#urlEncodedFormat(evaluate(tmpObj))#"; 
			else token="#tmpObj#=#URLEncodedFormat(evaluate(tmpObj))#"; 
		}
	}
	return token;
}
</cfscript>