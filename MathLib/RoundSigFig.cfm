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
 * Rounds a number to a specified number of significant digits.
 * 
 * @param fInput 	 Number to round. (Required)
 * @param iDigits 	 Number of significant digits to return. (Required)
 * @return Returns a numeric value. 
 * @author jason snyder (jason.snyder@trw.com) 
 * @version 2, October 24, 2003 
 */
function RoundSigFig(fInput, iDigits) 
{
  //Local Variables
  var iLog = 0;
  var iTemp = 0;
  var fReturn = 0;

  //Execution
  if (fInput NEQ 0) { //If not zero round to significant digits.
    iLog=Int(Log10(Sgn(fInput)*fInput+0.0));
    iTemp=Round(fInput / (10^(iLog-iDigits+1)));
    //return(Log10(fInput+0.0)); //Debugging
    fReturn=evaluate(iTemp*(10^(iLog-iDigits+1)));
  } //End (Round to significant digits.)
  Return(fReturn);
} //End (RSigFig)
</cfscript>