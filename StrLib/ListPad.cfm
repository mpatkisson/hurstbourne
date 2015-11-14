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
 * Applys padding to each element in a list.
 * 
 * @param list 	 List to apply the padding to. 
 * @param char 	 Character to use as the padding. 
 * @param strLen 	 Length to pad each list item out to.  No padding will be applied oif the length of the list item is greater than or equal to strLen. 
 * @param delimiter 	 Delimiter for the list.  Default is the comma. 
 * @return Returns a list. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, December 7, 2001 
 */
function ListPad(list, char, strLen)
{
  Var PaddedList = "";
  Var PadLen = 0;
  Var Delimiter = ",";
  Var i=0;
  if (ArrayLen(arguments) gt 3){
    Delimiter = arguments[4];
  }
  for (i=1; i LTE ListLen(list, delimiter); i=i+1){
    PadLen = strLen-Len(ListGetAt(list, i, delimiter));
    if (PadLen GTE 0){
		  PaddedList = ListAppend(PaddedList, RepeatString(char, PadLen) & ListGetAt(list, i, delimiter), delimiter);
    }
    else {
      PaddedList = ListAppend(PaddedList, ListGetAt(list, i, delimiter), delimiter);
    }
  }
  Return PaddedList;
}
</cfscript>