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
 * Used to remove qualifieers from a delimited list.
 * 
 * @param lst 	 List to dequalify. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 1, July 28, 2005 
 */
function listDeQualify(lst) {
	// the chr()s are the MS single and double quotes
	var qualifiers="',"",#chr(145)#,#chr(146)#,#chr(147)#,#chr(148)#,#chr(8220)#,#chr(8221)#,#chr(8216)#,#chr(8217)#";
	var workList="";
	var delim=",";
	var listElement="";
	var firstChar="";
	var lastChar="";
	var i = 1;
	
	// if delim specified...
	if (arraylen(arguments) eq 2) delim=arguments[2];

	// loop the list, pull the first and last char from each element to evaluate
	for (;i lte listlen(lst,delim);i=i+1) {
		listElement=trim(listgetat(lst,i,delim));
		firstChar=left(ListElement,1);
		lastChar=Right(ListElement,1);
		
		if (listFindNoCase(qualifiers,firstChar) ) {ListElement=right(ListElement,len(ListElement)-1);}
		if (listFindNoCase(qualifiers,lastChar) ) {ListElement=left(ListElement,len(ListElement)-1);}
		workList=listappend(workList,listElement,delim);
	}
	return workList;
}
</cfscript>