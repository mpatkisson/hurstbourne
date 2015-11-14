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
 * Converts a structure to hidden form fields.
 * 
 * @param struct 	 The structure to convert. 
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, March 10, 2002 
 */
function structToHidden(struct){
	//a variable for iterating
	var key = "";
	//a variable to return stuff
	var outVar = "";
	//now loop through the form scope and make hidden fields
	for(key in struct){
		if(isSimpleValue(struct[key]))
			outVar = outVar & "<input type=""hidden"" name=""" & key & """ value=""" & htmlEditFormat(struct[key]) & """>";
	}
	return outVar;		
}
</cfscript>