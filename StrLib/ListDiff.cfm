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
 * Compares two lists and returns the elements that do not appear in both lists.
Returns a list that contains the elementsrest between list1 and list2
 * 
 * @param list1 	 First list to compare (Required)
 * @param list2 	 Second list to compare (Required)
 * @param delimiters 	 Delimiter for all lists.  Defualt is comma. (Optional)
 * @return Returns a string. 
 * @author Ivan Rodriguez (wantez015@hotmail.com) 
 * @version 1, June 26, 2002 
 */
function ListDiff(list1,list2)	{
  var delimiters	= ",";
  var listReturn = "";
  var position = 1;

  // default list delimiter to a comma unless otherwise specified	
  if (arrayLen(arguments) gte 3){
    delimiters	= arguments[3];
  }
		
  //checking list1
  for(position = 1; position LTE ListLen(list1,delimiters); position = position + 1) {
    value = ListGetAt(list1, position , delimiters );
    if (ListFindNoCase(list2, value , delimiters ) EQ 0)
      listReturn = ListAppend(listReturn, value , delimiters );
    }
		
    //checking list2
    for(position = 1; position LTE ListLen(list2,delimiters); position = position + 1)	{
      value = ListGetAt(list2, position , delimiters );
      if (ListFindNoCase(list1, value , delimiters ) EQ 0)
        listReturn = ListAppend(listReturn, value , delimiters );
  }
  return listReturn;
}
</cfscript>