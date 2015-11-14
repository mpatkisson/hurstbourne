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
 * Removes specified fields from a form structure.
 * 
 * @param fieldList 	 List of fields to return. (Required)
 * @return Returns nothing. 
 * @author Tom Young (tom@thenewmediagroup.com) 
 * @version 1, June 12, 2003 
 */
function deleteFormFields(fieldList) {
	var listIndex = 1;
	var i = 1;
	fieldList = ListToArray(fieldList);
	for(i = 1; i lte ArrayLen(fieldList); i = i + 1) {
		StructDelete(form, fieldList[i]);
		listIndex = ListFindNoCase(form.fieldnames, fieldList[i]);
		form.fieldnames = ListDeleteAt(form.fieldnames, listIndex);
	}
}
</cfscript>