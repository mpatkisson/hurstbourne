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
 * Removes second list from first list, accepting an optional delimiter and whether to remove one or all list items.
 * 
 * @param list1 	 List to parse. (Required)
 * @param list2 	 List of items to remove. (Required)
 * @param delimiters 	 Delimiter. Defaults to a comma. (Optional)
 * @param scope 	 One or all. If one, removes one instance of the item from list2. All if otherwise. Defaults to one. (Optional)
 * @return Returns a string. 
 * @author Ann Terrell (ann@landuseoregon.com) 
 * @version 2, May 10, 2005 
 */
function ListRemoveList(list1,list2)	{
  var delimiters	= ",";
  var removeall = false;
  var listReturn = list1;
  var position = 1;

  // default list delimiter to a comma unless otherwise specified
  if (arrayLen(arguments) gte 3) delimiters=arguments[3];

  // default removal pattern is remove one of each item in list2
  if (arrayLen(arguments) eq 4 and  arguments[4] eq "all") removeall=true;
  
  //checking list1
  for(position = 1; position LTE ListLen(list2,delimiters); position = position + 1) {
    value = ListGetAt(list2, position , delimiters );
	 
	if (removeall) {
   		while (ListFindNoCase(listReturn, value , delimiters ) NEQ 0)
	      	listReturn = ListDeleteAt(listReturn, ListFindNoCase(listReturn, value , delimiters ) , delimiters );
		}
	else {
			if (ListFindNoCase(listReturn, value , delimiters ) NEQ 0)
      		listReturn = ListDeleteAt(listReturn, ListFindNoCase(listReturn, value , delimiters ) , delimiters );
		}
    }
		
  return listReturn;
}
</cfscript>