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
 * Replaces variable placeholders with values of said variables.
 * 
 * @param thisField 	 The string to check. (Required)
 * @param identifier 	 The string used as a variable identifier. (Required)
 * @param query 	 Query to retrive data from. (Optional)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
// Replaces variable placeholders with variable values.
function RePlaceHolders(thisField,identifier){
	var start=1;
	var st="";
	var end="";
	var temp="";
	var tempVar="";
        var query = "";
	if (ArrayLen(arguments) EQ 3) {
		query="#arguments[3]#.";
	}
	for(i=1;i lte Len(thisField);i=i+1){
		st=#Find(identifier,thisField,start)#;
		if(st gt 0){
			end=#Find(identifier,thisField,st+1)#+1;
			ct=end-st;
			temp=Mid(thisField,st,ct);
			tempVar=evaluate("###query##ReplaceNoCase(temp,identifier,"","ALL")###");
			thisField=ReplaceNoCase(thisField,temp,tempVar,"ALL");
			if(Len(temp) gt Len(tempVar)){
				end=end-(Len(temp)-Len(tempVar));
			}else{
				end=end+(Len(tempVar)-Len(temp));
			}
			start=end+1;
		}
	}
	return thisField;
}
</cfscript>