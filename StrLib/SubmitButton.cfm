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
 * Create a simple submit button by providing name, value, class, width, and onClick.
 * 
 * @param name 	 The name of the submit button. 
 * @param value 	 The value of the submit button. 
 * @param class 	 The CSS class to use. 
 * @param width 	 Width of the submit button. 
 * @param onClick 	 JavaScript function to call when the button is clicked. 
 * @return Returns a string. 
 * @author Jesse Monson (jesse@ixstudios.com) 
 * @version 1, April 24, 2002 
 */
function submitButton(name,value) {
	var class="";
    var width="";
	var onClick="";
	
	if (arrayLen(arguments) gte 3) {class = " class=""#arguments[3]#""";}
	if (arrayLen(arguments) gte 4) {width = " width=""#arguments[4]#"" style=""width:#arguments[4]#px""";}
	if (arrayLen(arguments) gte 5) {onClick = " onClick=""#arguments[5]#""";}	
	return "<input type=""submit"" name=""#name#"" value=""#value#""#width##class##onClick#>";
}
</cfscript>