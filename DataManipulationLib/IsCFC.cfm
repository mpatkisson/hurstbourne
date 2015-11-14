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
 * Returns a boolean for whether a CF variable is a CFC instance.
 * 
 * @param objectToCheck 	 The object to check. (Required)
 * @return Returns a boolean. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, October 16, 2002 
 */
function IsCFC(objectToCheck){
	//get the meta data of the object we're inspecting
	var metaData = getMetaData(arguments.objectToCheck);
	//if it's an object, let's try getting the meta Data
	if(isObject(arguments.objectToCheck)){
		//if it has a type, and that type is "component", then it's a component
		if(structKeyExists(metaData,"type") AND metaData.type is "component"){
			return true;
		}
	}	
	//if we've gotten here, it must not have been a contentObject			
	return false;		
}
</cfscript>