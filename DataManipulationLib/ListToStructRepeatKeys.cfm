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
 * Based on ListToStruct() from Rob Brooks-Bilson, this one allows the structure key to be repeated and the value added to a list.
 * Version 2 - Ray modified the code a bit and fixed a missing var.
 * 
 * @param list 	 List of key and value pairs. (Required)
 * @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a struct. 
 * @author Tony Brandner (tony@brandners.com) 
 * @version 2, August 3, 2005 
 */
function listToStructRepeatKeys(list){
  var myStruct=StructNew();
  var i=0;
  var delimiter=",";
  var tempVar="";

  if(arrayLen(arguments) gt 1) delimiter = arguments[2];

  for(i=listLen(list, delimiter); i gt 0; i=i-1) {
  	tempVar = trim(listGetAt(list, i, delimiter));
  	if (structKeyExists(myStruct,listFirst(tempVar, "="))) {
		myStruct[listFirst(tempVar, "=")] = listAppend(myStruct[listFirst(tempVar, "=")],listLast(tempVar, "="));
	} else {
		myStruct[listFirst(tempVar, "=")] = listLast(tempVar, "=");
	}
  }
  return myStruct;
}
</cfscript>