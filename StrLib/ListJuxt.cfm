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
 * Juxtaposes two lists together in an &quot;every other value&quot; method.
 * Minor modifications by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param List1 	 First list of delimited values. (Required)
 * @param List2 	 Second list of delimited values. (Required)
 * @param Delim1 	 Delimiter used for List1.  Default is the comma. (Optional)
 * @param Delim2 	 Delimiter used for List2.  Default is the comma. (Optional)
 * @param Delim3 	 Delimiter to use for the list returned by the function.  Default is the comma. (Optional)
 * @return Returns a string (delimited list of values). 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function ListJuxt(list1,list2)
{
  var i=1;
  var newList="";
  var delim1=",";
  var delim2 = ",";
  var delim3 = ",";
  switch(ArrayLen(arguments)) {
    case 3:
      {
        delim1 = Arguments[3];
        break;
      }
    case 4:
      {
        delim1 = Arguments[3];
        delim2 = Arguments[4];
        break;
      }
    case 5:
      {
        delim1 = Arguments[3];
        delim2 = Arguments[4];          
        delim3 = Arguments[5];
        break;
      }        
  }

  for(i=1;i lte Max(ListLen(list1, delim1),ListLen(list2, delim2));i=i+1){
    if(i lte ListLen(list1, delim1)){
      newList=ListAppend(newList,ListGetAt(list1,i,delim1),delim3);
    }
    else{
      newList=ListAppend(newList,"",delim3);
    }
    if(i lte ListLen(list2, delim2)){
      newList=ListAppend(newList,ListGetAt(list2,i,delim2),delim3);
    }
    else{
      newList=ListAppend(newList,"",delim3);
    }
  }
  return newList;
}
</cfscript>