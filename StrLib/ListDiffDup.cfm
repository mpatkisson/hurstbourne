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
 * Compares two lists and returns the elements that are unique for each list.
 * Added var statements.
 * 
 * @param list1 	 The first list. (Required)
 * @param list2 	 The second list. (Required)
 * @param delimiters 	 Delimiter for both lists. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Anonymous (anonymous@gmail.com) 
 * @version 1, October 4, 2007 
 */
function ListDiffDup(list1,list2)	{
  var delimiters	= ",";
  var listReturn = "";
  
  // Use two temporary lists.
  var temp1 = list1;
  var temp2 = list2;
  
  var i = 1;
  var pos = 1;

  // default list delimiter to a comma unless otherwise specified
  if (arrayLen(arguments) gte 3){
    delimiters	= arguments[3];
  }


	// Loop over the first list, eliminate all duplicate elements from the temp2 list.
  for (i=1; i lte ListLen(list1,delimiters); i=i+1) {
  	pos = ListFindNoCase(temp2,ListGetAt(list1,i,delimiters),delimiters);
	if (pos neq 0) {
		temp2 = ListDeleteAt(temp2,pos,delimiters);
	}
  }

	// Loop over the second list, eliminate all duplicate elements from the temp1 list.
  for (i=1; i lte ListLen(list2,delimiters); i=i+1) {
  	pos = ListFindNoCase(temp1,ListGetAt(list2,i,delimiters),delimiters);
	if (pos neq 0) {
		temp1 = ListDeleteAt(temp1,pos,delimiters);
	}
  }

  // Append all distinct elements from the first list to the return list
  for (i=1; i lte ListLen(temp1,delimiters); i=i+1) {
  	listReturn = ListAppend(listReturn,ListGetAt(temp1,i,delimiters),delimiters);
  }
		
  // Append all distinct elements from the second list to the return list.
  for (i=1; i lte ListLen(temp2,delimiters); i=i+1) {
  	listReturn = ListAppend(listReturn,ListGetAt(temp2,i,delimiters),delimiters);
  }

  return listReturn;
}
</cfscript>