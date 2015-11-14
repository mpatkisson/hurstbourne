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
 * Gets the current stack trace, even if no error was thrown, and returns it in a query.
 * Removed var e as it breaks in CF9
 * 
 * @return Returns a query. 
 * @author Ivo D. SIlva (aphex@netvisao.pt) 
 * @version 2, July 1, 2011 
 */
function getStackTrace() {
  var j = "";
  var i = "";
  var StackTrace = "";
  
  try
  {
    j = CreateObject("java","java.lang.Throwable");
    j = j.getStackTrace();

    StackTrace = QueryNew("ClassName,MethodName,NativeMethod,LineNumber,hashCode");
    QueryAddRow(StackTrace,ArrayLen(j));
  
    for (i=1; i le ArrayLen(j); i = i+1)
    {
      QuerySetCell(StackTrace,'ClassName',j[i].getClassName(),i);
      QuerySetCell(StackTrace,'MethodName',j[i].getMethodName(),i);
      QuerySetCell(StackTrace,'NativeMethod',j[i].isNativeMethod(),i);
      QuerySetCell(StackTrace,'LineNumber',j[i].getLineNumber(),i);
      QuerySetCell(StackTrace,'hashCode',j[i].hashCode(),i);
    }
  }
  catch ( any e )
  {
    return e;
  }
  
  return StackTrace;
}
</cfscript>