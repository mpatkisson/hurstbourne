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
 * Returns the mode and frequency for a given set of values.
 * 
 * @param values 	 Comma delimited list or one dimensional array of numeric values. 
 * @return Returns a structure. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, September 7, 2001 
 */
function Mode(values)
{
  Var MyStruct = StructNew();
  Var Frequency = 0;
  Var Mode = "";
  Var mMode = StructNew();
  Var i=0;
  if (IsArray(values)){
     values = ArrayToList(values);
    }
  for (i=1; i LTE ListLen(values); i=i+1) {  
    element = ListGetAt(values, i);
    if (StructKeyExists(MyStruct, element)) {
      StructUpdate(MyStruct, element,  IncrementValue(MyStruct[element]));		
      }
    else {
      StructInsert(MyStruct, element, "1");
    }
  }
  MyKeyArray = StructKeyArray(MyStruct);
  for (i=1; i LTE ArrayLen(MyKeyArray); i=i+1) {
  	if (MyStruct[MyKeyArray[i]] GTE Frequency) {
  		Frequency = MyStruct[MyKeyArray[i]];
      }
  }
  for (i=1; i LTE ArrayLen(MyKeyArray); i=i+1) {
    if (MyStruct[MyKeyArray[i]] eq Frequency) {
  	  Mode = ListAppend(Mode, MyKeyArray[i]);
      }
  }
 mMode["Mode"] = ListSort(Mode, "Numeric");
 mMode["Frequency"] = Frequency;
 Return mMode;
}
</cfscript>