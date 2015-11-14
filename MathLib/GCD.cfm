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
 * Calculates the GCD (greatest common factor [divisor]) of two positive integers using the Euclidean Algorithm.
 * 
 * @param int1 	 Positive integer. 
 * @param int2 	 Positive integer. 
 * @param showWork 	 Boolean.  Yes or No.  Specifies whether to display work.  Default is No. 
 * @return Returns a numeric value.  Optionally outputs a string. 
 * @author Shakti Shrivastava (shakti@colony1.net) 
 * @version 1, November 8, 2001 
 */
function GCD(int1, int2)
{
  Var ShowWork=False;
  If (ArrayLen(Arguments) eq 3 AND Arguments[3] eq "yes"){
    ShowWork=True;
  }
   
  // if both numbers are 0 return undefined
  if (int1 eq 0 and int2 eq 0) return 'Undefined';

  // if both numbers are equal or either one of them is equal to 0 
  // then return any 1 of those numbers appropriately
  if (int1 eq int2 or int2 eq 0) return int1;
  if (int1 eq 0) return int2;

  // if int2 divides int1 "properly" then we have reached our final 
  //   step. So we output the last step and exit the function.
  if (int1 mod int2 eq 0) {
    if(ShowWork EQ True) {
      WriteOutput("<br>"&int1&"= "&fix(int1/int2)&" X "&int2&" + "&int1 mod int2); 
    }
    // this line outputs the last iteration
    if (ShowWork EQ True) {
      return "<p>GCD = "&int2; //print the GCD
    }
    else{
      return int2;
    }
  }

  // if int2 does not divides int1 "properly" then we recurse using
  // int1 equal to int2 and int2 equal to int1 mod int2
  else {
    if(ShowWork EQ True)
      // this line outputs calculations from each iteration. you can safely
      // delete/comment out this line if you dont need to display the steps.
      WriteOutput("<br>"&int1&"= "&fix(int1/int2)&" X "&int2&" + "&int1 mod int2); 
  }
  //since we still have not reached the last step we recall the function 		
  //(recurse)
  GCD(int2, int1 mod int2, ShowWork);
}
</cfscript>