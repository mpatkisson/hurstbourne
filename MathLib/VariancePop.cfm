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
 * Returns the population variance for a set of numeric values.
 * 
 * @param values 	 Comma delimited list or one dimensional array of numeric values. 
 * @return Returns a numeric value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, October 16, 2001 
 */
function VariancePop(values)
{
  Var MyArray = 0;
  Var NumValues = 0;
  Var xBar = 0;
  Var SumxBar = 0;  
  Var i=0;
  if (IsArray(values)){
     MyArray = values;
    }
  else {
     MyArray = ListToArray(values);
    }
  NumValues = ArrayLen(MyArray);
  xBar = ArrayAvg(MyArray);
  for (i=1; i LTE NumValues; i=i+1) {
    SumxBar = SumxBar + ((MyArray[i] - xBar)*(MyArray[i] - xBar));
    }
  Return SumxBar/NumValues;
}
</cfscript>