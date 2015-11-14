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
 * Combines two lists, automatically removing duplicate values and returning a sorted list.
 * 
 * @param List1 	 First list of delimited values. 
 * @param List2 	 Second list of delimited values. 
 * @param Delim1 	 Delimiter used for List1.  Default is the comma. 
 * @param Delim2 	 Delimiter used for List2.  Default is the comma. 
 * @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma. 
 * @param SortType 	 Type of sort:  Text or Numeric.  The default is Text. 
 * @param SortOrder 	 Asc for ascending, DESC for descending.  Default is Asc 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, November 14, 2001 
 */
function ListUnion(List1, List2)
{
  var TempList = "";
  var CombinedList = "";  
  Var SortType="text";
  Var SortOrder="asc";
  var Delim1 = ",";
  var Delim2 = ",";
  var Delim3 = ",";
  var i = 0;
  // Handle optional arguments
  switch(ArrayLen(arguments)) {
    case 3:
      {
        Delim1    = Arguments[3];
        break;
      }
    case 4:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        break;
      }
    case 5:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        break;
      }       
    case 6:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        SortType  = Arguments[6];
        break;
      }       
    case 7:
      {
        Delim1    = Arguments[3];
        Delim2    = Arguments[4];        
        Delim3    = Arguments[5];  
        SortType  = Arguments[6];
        SortOrder = Arguments[7];
        break;
      }                    
  } 
  
  // Combine list 1 and list 2 with the proper delimiter
  CombinedList = ListChangeDelims(List1, Delim3, Delim1) & Delim3 &  ListChangeDelims(List2, Delim3, Delim2);
  // Strip duplicates if indicated
  for (i=1; i LTE ListLen(CombinedList, Delim3); i=i+1) {
    if (NOT ListFindNoCase(TempList, ListGetAt(CombinedList, i, Delim3), Delim3)){
     TempList = ListAppend(TempList, ListGetAt(CombinedList, i, Delim3), Delim3);
    }
  }
  Return ListSort(TempList, SortType, SortOrder, Delim3);
}
</cfscript>