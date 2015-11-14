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
 * Returns the number of occurances of a word in a string.
 * Minor edit by Raymond Camden
 * 
 * @param word 	 The word to count. (Required)
 * @param string 	 The string to check. (Required)
 * @return Returns the number of times the word appears. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 2, September 20, 2004 
 */
function WordInstance(word,string){
	var i=0;
	var start=1;
	var j = 1;
	var tmp = "";
	
	string = " " & string & " ";
	for(j=1;j lte Len(string);j=j+1){
		tmp=REFindNoCase("[^a-zA-Z]+#word#[^a-zA-Z]+",string,start);
		if(tmp gt 0){
			i=i+1;
			start=tmp+Len(word);
		}else{
			start=start+1;
		}
	}
	return i;
}
</cfscript>