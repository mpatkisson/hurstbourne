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
 * Converts the URL structure to hidden form fields.
 * 
 * @param excludeList 	 A list of keys not to copy from the URL structure. 
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, March 10, 2002 
 */
function urlToHidden(){
	//a variable for iterating
	var key = "";
	//should we exlude any?  by default, no
	var excludeList = "";
	//a variable to return stuff
	var outVar = "";
	//if there is an argument, it is a list to exclude
	if(arrayLen(arguments))
		excludeList = arguments[1];
	//now loop through the form scope and make hidden fields
	for(key in url){
		if(NOT listFindNoCase(excludeList,key))
			outVar = outVar & "<input type=""hidden"" name=""" & key & """ value=""" & htmlEditFormat(url[key]) & """>";
	}
	return outVar;		
}
</cfscript>