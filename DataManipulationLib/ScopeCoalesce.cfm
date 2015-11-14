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
 * This UDF will find the first variable scope that exists for a variable in the list of variable scopes and return its value.
 * 
 * @param strVariable 	 Variable to check for. (Required)
 * @param lstScope 	 List of scopes to check. (Required)
 * @param default 	 Default value to use if the variable does not exists. Defaults to an empty string. (Optional)
 * @return Returns any possible value. 
 * @author Scott Jibben (scott@jibben.com) 
 * @version 1, February 17, 2004 
 */
function ScopeCoalesce(strVariable, lstScopes) {
  var vRet = "";
  var nIndex = 1;
  var nLstLen = ListLen(lstScopes);

  // assign the default return if passed in
  If (ArrayLen(Arguments) GTE 3)
    vRet = Arguments[3];

  // loop over the list
  while (nIndex LTE nLstLen) {
    if (IsDefined(ListGetAt(lstScopes, nIndex) & '.' & strVariable)) {
      vRet = Evaluate(ListGetAt(lstScopes, nIndex) & '.' & strVariable);
      break;
    }
    nIndex = nIndex + 1;
  }

  return vRet;
}
</cfscript>