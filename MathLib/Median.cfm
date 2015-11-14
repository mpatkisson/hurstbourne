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
 * Returns the median (middle) value for a set of numberic values.
 * 
 * @param values 	 Comma delimited list or one dimensional array of numeric values. 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 18, 2001 
 */
function Median(values)
{
  Var x = 0;
  Var NumberOfElements = 0;
  Var LeftCenterPosition = 0;
  Var RightCenterPosition = 0;
  Var MyArray = 0;
  if (IsArray(values)){
     MyArray = values;
    }
  else {
     MyArray = ListToArray(values);
    }
  ArraySort(MyArray, "numeric");
  x = ArrayToList(MyArray);
  NumberOfElements = ListLen(x);
  if ((NumberOfElements MOD 2) EQ 0) {
	  LeftCenterPosition = ListGetAt(x, (Int(NumberOfElements/2)), ",");
	  RightCenterPosition = ListGetAt(x, (Int(NumberOfElements/2)+1), ",");
	  Return (LeftCenterPosition + RightCenterPosition)/2;
    }
  else {
	  Return ListGetAt(x, Int(NumberOfElements/2)+1, ",");
    }
}
</cfscript>