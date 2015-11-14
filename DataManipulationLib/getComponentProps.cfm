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
 * Returns an array of all properties in cfc's metadata, inherited or not.
 * v2 was submitted by salvatore fusto
 * v3 ditto
 * 
 * @param object 	 The metadata from a component. (Required)
 * @return Returns an array of structs. 
 * @author Robby Lansaw (robby@ohsogooey.com) 
 * @version 3, May 18, 2012 
 */
function getComponentProps(object) {
       var propArray = arrayNew(1);
       if (structKeyExists(object,'properties')) {
               propArray = object.properties;
       }
       if (structKeyExists(object,'extends')) {
               propArray.addAll(getComponentProps(object.extends ));
       }
       return propArray;
}
</cfscript>