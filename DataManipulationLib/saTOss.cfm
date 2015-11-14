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
 * Converts a structure of arrays into a name/key style structure.
 * 
 * @param struct 	 Structure to convert. (Required)
 * @param theKey 	 Struct key used to define new struct. (Required)
 * @param cols 	 Keys to include in new structure. (Optional)
 * @return Returns a structure. 
 * @author Casey Broich (cab@pagex.com) 
 * @version 1, June 12, 2003 
 */
function saTOss(struct,thekey){
	var x = "";
	var i = ""; 
	var ii = ""; 
	var new = structnew();
	var cols = structkeyarray(Struct); 

	if(arrayLen(arguments) GT 2) cols = listToArray(arguments[3]);
	
	for(i = 1; i lte arraylen(Struct[thekey]); i = i + 1){
		new[Struct[thekey][i]] = structnew();
		for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
			new[Struct[thekey][i]][cols[ii]] = Struct[cols[ii]][i];
		}
	}
	return new;
}
</cfscript>