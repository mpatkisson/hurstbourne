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
 * Used to create an Ordered Numeric List
 * v2 mods by Raymond Camden
 * 
 * @param st 	 Start number. (Required)
 * @param end 	 End number. (Required)
 * @param step 	 Step value. Defaults to 1. (Optional)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 1, September 28, 2006 
 */
function createOrderedList(st,end) {
	var theList="";
	var delim=",";
	var step=1;

	// 3rd argument sets the step increment
	if(arraylen(arguments) gte 3) step=arguments[3];

	//4th argument sets the delim
	if(arraylen(arguments) eq 4) delim=arguments[4];

	if(st gte end) for(i = st;i gte end;i=i-step) theList=listappend(theList,i,delim);		
	else for(i = st;i lte end;i=i+step) theList=listappend(theList,i,delim);		

	return theList;
}
</cfscript>