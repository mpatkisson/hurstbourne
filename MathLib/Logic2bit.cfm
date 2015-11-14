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
 * Converts logic bit constants (TRUE, &quot;Yes&quot;, 1,FALSE,&quot;No&quot;,0) or logical expressions to bit values (1,0).  A non-boolean value returns a -1 value.
 * 
 * @param exp 	 Expresison to evaluate (Required)
 * @return Returns a Boolean. 
 * @author Joseph Flanigan (joseph@switch-box.org) 
 * @version 1, June 26, 2002 
 */
function Logic2bit(exp){
 if (IsBoolean(exp)){
  if (exp) return 1;
  if (NOT (exp)) return 0;
}
else return(-1);
}
</cfscript>