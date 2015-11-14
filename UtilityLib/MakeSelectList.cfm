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
 * Creates a Select form item populated with given string items.
 * Mods by RCamden and Grant Furick.
 * 
 * @param name 	 The name of the Select item. (Required)
 * @param displayList 	 The text values for the drop down. (Required)
 * @param defaultSelected 	 The selected item. (Optional)
 * @param valueListSTR 	 The values for the drop down. Defaults to displayList. (Optional)
 * @param delimiter 	 The delimiter to use for all lists. (Optional)
 * @param mutliple 	 Turns on multiple for the drop down. Default is false. (Optional)
 * @param size 	 Size of the drop down.  (Optional)
 * @return Returns a string. 
 * @author Seth Duffey (sduffey@ci.davis.ca.us) 
 * @version 2, June 21, 2002 
 */
function MakeSelectList(name, displayList) {
    var outstring = "<select name=""#name#""";
	var defaultSelected = "";
	var valueListSTR = displayList;
	var delimiter = ",";
	var i = 1;

	if(arrayLen(arguments) gt 2) defaultSelected = arguments[3];
	if(arrayLen(arguments) gt 3) valueListSTR = arguments[4];
	if(arrayLen(arguments) gt 4) delimiter = arguments[5];
    if(arrayLen(arguments) gt 5 AND arguments[6]) outstring = outstring & " multiple";
    if(arrayLen(arguments) gt 6) outstring = outstring & " size=#arguments[7]#";
    outstring = outstring & ">";

    for (i=1; i LTE listLen(displayList,delimiter); i=i+1) {
		outstring = outstring & "<option value=""#listGetAt(valueListSTR,i,delimiter)#""";
		if(defaultSelected eq listGetAt(valueListSTR,i,delimiter)) outstring = outstring & " selected";
        outstring = outstring & ">#listGetAt(displayList,i,delimiter)#</option>";
    }

    outstring = outstring & "</select>";
	
    return outstring;
}
</cfscript>