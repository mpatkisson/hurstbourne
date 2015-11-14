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
 * Checks that a variable exists and has value. CFMX version.
 * 
 * @param varname 	 The name of the variable to test for (Required)
 * @param value 	 The value a simple variable should be to pass the test (optional) (Optional)
 * @return 1 (yes, it is defined) or 0 (no, it is not defined) 
 * @author Joseph Flanigan (joseph@switch-box.org) 
 * @version 1, October 20, 2003 
 */
function isDefinedValueMX(varname)
{
  var varvalue = "";
    try{
    if (IsDefined(listfirst(Arguments[1],"[")))
     { 
     varvalue = evaluate(Arguments[1]);

     if (IsSimpleValue(varvalue))
        { 
            if (ArrayLen(Arguments) EQ 2 )
                { if ( varvalue EQ Arguments[2]){return 1;}
                else return 0; 
                }
            else if ( find(varvalue,"" )) {return 0;}  
            else return 1;  // something is there, just not testing for it.
        } 
     else if (IsStruct(varvalue))
        { 
            if (StructIsEmpty(varvalue)) { return 0;} 
            else {return 1;}
        }
     else if (IsArray(varvalue))
        { 
            if (ArrayIsEmpty(varvalue)) {return 0;} 
            else {return 1;}
        }
     else if (IsQuery(varvalue))
        { 
            if (YesNoFormat(varvalue.recordcount)) {return 1;} 
            else {return 0;}
        }
    return 0; // not defined
      }
     } //try
     catch(Any excpt)
      { return 0;} // return excpt.Message;
return 0; 
}
</cfscript>