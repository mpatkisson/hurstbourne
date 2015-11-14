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
 * Tells whether two lists have entirely distinct elements
 * 
 * @param list1 	 The first list (Required)
 * @param list2 	 The second list (Required)
 * @param delim1 	 The delimiter of the first list (default is comma) (Optional)
 * @param delim2 	 The delimiter of the second list (default is comma) (Optional)
 * @return boolean 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, June 25, 2003 
 */
function listsAreDistinct(list1,list2){
	var delim1 = ",";
	var delim2 = ",";
	var ii = 0;
	var array = "";
	//deal with the optional delimiter arguments
	switch(arrayLen(arguments)) {
		case 3:
		{
			delim1 = arguments[3];
			break;
		}
		case 4:
		{
			delim1 = arguments[3];
			delim2 = arguments[4];
			break;
		}
	}
	//make list1 into an array for easy looping
	array = listToArray(list1,delim1);
	//loop through list1 checking for any matches in list2
	for(ii = 1; ii LTE arrayLen(array); ii = ii + 1){
		//if this element exists in list 2, return false
		if(listFindNoCase(list2,array[ii],delim2))
			return false;
	}
	//if we've gotten this far, the lists are distinct
	return true;
}
</cfscript>