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
 * Rounds a number up or down to the nearest specified multiple.
 * 
 * @param input 	 Number you want to round. (Required)
 * @param multiple 	 Multiple by which to round.  Default is 5. (Optional)
 * @param direction 	 Direction to round.  Options are Up or Down.  Default is Up (Optional)
 * @return Returns a numberic value 
 * @author Casey Broich (cab@pagex.com) 
 * @version 1, June 27, 2002 
 */
function RoundUpDown(input){
  var roundval = 5;
  var direction = "Up";
  var result = 0;

  if(ArrayLen(arguments) GTE 2) 
    roundval = arguments[2];
  if(ArrayLen(arguments) GTE 3) 
    direction = arguments[3];
  if(roundval EQ 0) 
    roundval = 1;

  if((input MOD roundval) NEQ 0){
     if((direction IS 1) OR (direction IS "Up")){
      result = input + (roundval - (input MOD roundval));
     }else{
      result = input - (input MOD roundval);
     }
  }else{
    result = input;
  }
  return result;
}
</cfscript>