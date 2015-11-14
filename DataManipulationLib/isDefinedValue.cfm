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
 * Checks that a variable is defined and  that the variable  is not an empty value.  Optionally lets you check that the variable is a specific value.
 * See also: isEmpty() -- http://cflib.org/udf.cfm?id=420
 * 
 * @param varname 	 Name of the variable to check for (Required)
 * @param value 	 The value a simple variable should be to pass the test (optional) (Optional)
 * @return boolean - 1 or 0 
 * @author Joseph Flanigan (joseph@switch-box.org) 
 * @version 1, August 18, 2003 
 */
function isDefinedValue(varname)
{
  var value = "";
    if (IsDefined(listfirst(Arguments[1],"[")))
     { 
     value = evaluate(Arguments[1]);
     if (IsSimpleValue(value))
        { 
            if (ArrayLen(Arguments) EQ 2 )
                { if ( value EQ Arguments[2]){return 1;}
                else return 0; 
                }
            else if ( find(value,"" )) {return 0;}  
            else return 1;  // something is there, just not testing for it.
        } 
     else if (IsStruct(value))
        { 
            if (StructIsEmpty(value)) { return 0;} 
            else {return 1;}
        }
     else if (IsArray(value))
        { 
            if (ArrayIsEmpty(value)) {return 0;} 
            else {return 1;}
        }
     else if (IsQuery(value))
        { 
            if (YesNoFormat(value.recordcount)) {return 1;} 
            else {return 0;}
        }
    return 0;
      }
return 0;
}
</cfscript>