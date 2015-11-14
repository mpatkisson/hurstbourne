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
 * Converts a delimited list of key/value pairs to a structure.
 * v2 mod by James Moberg
 * 
 * @param list 	 List of key/value pairs to initialize the structure with.  Format follows key=value. (Required)
 * @param delimiter 	 Delimiter seperating the key/value pairs.  Default is the comma. (Optional)
 * @return Returns a structure. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 2, April 1, 2010 
 */
function listToStruct(list){
       var myStruct = StructNew();
       var i = 0;
       var delimiter = ",";
       var tempList = arrayNew(1);
       if (ArrayLen(arguments) gt 1) {delimiter = arguments[2];}
       tempList = listToArray(list, delimiter);
       for (i=1; i LTE ArrayLen(tempList); i=i+1){
               if (not structkeyexists(myStruct, trim(ListFirst(tempList[i], "=")))) {
                       StructInsert(myStruct, trim(ListFirst(tempList[i], "=")), trim(ListLast(tempList[i], "=")));
               }
       }
       return myStruct;
}
</cfscript>