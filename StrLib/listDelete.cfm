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
 * Delete items from a list.
 * 
 * @param variable 	 An item, or a list of items, to remove from the list. (Required)
 * @param qs 	 The actual list to parse. Can be blank. (Optional)
 * @return Returns a string. 
 * @author Alessandro Chisari (ruchizzy@hotmail.com) 
 * @version 1, May 17, 2006 
 */
function listdelete(variable){
        //var to hold the final string
        var string = "";
        //vars for use in the loop, so we don't have to evaluate lists and arrays more than once
        var ii = 1;
        var thisVar = "";
        var thisIndex = "";
        var array = "";
        var qs = "";
        if(arrayLen(arguments) GT 1)
                qs = arguments[2];
        //put the query string into an array for easier looping
        array = listToArray(qs,",");            
        //now, loop over the array and rebuild the string
        for(ii = 1; ii lte arrayLen(array); ii = ii + 1){
                thisIndex = array[ii];
                thisVar = thisIndex;
                //if this is the var, edit it to the value, otherwise, just append
                if(not listFindnocase(variable,thisVar))
                        string = listAppend(string,thisIndex,",");
        }
        //return the string
        return string;
}
</cfscript>