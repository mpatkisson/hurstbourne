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
 * Returns the position of an element in an array of structures.
 * 
 * @param array 	 Array to search. (Required)
 * @param searchKey 	 Key to check in the structs. (Required)
 * @param value 	 Value to search for. (Required)
 * @return Returns the numeric index of a match. 
 * @author Nath Arduini (nathbot@gmail.com) 
 * @version 0, June 11, 2009 
 */
function arrayOfStructsFind(Array, SearchKey, Value){
	var result = 0;
	var i = 1;
	var key = "";
	for (i=1;i lte arrayLen(array);i=i+1){
		for (key in array[i])
		{
			if(array[i][key]==Value and key == SearchKey){
				result = i;
				return result;
			}
		}
	}
    
    return result;
}
</cfscript>