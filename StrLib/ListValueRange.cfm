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
 * Returns a comma delimited list filled with the positive intergers from the specified range.
 * Minor modifications by Rob Brooks-Bilson (rbils@amkor.com)
 * 
 * @param min 	 Minimum positive integer of range. 
 * @param max 	 Maximum positive integer  of range. 
 * @param delimiter 	 Delimiter for the list of returned values.  Default is the comma. 
 * @return Returns a string (delimited list). 
 * @author Brad Breaux (bbreaux@blipz.com) 
 * @version 1, August 27, 2001 
 */
function ListValueRange(min,max)
{
  Var cnt=0;
  Var outstring="";
  Var delimiter=",";
  if (ArrayLen(arguments) eq 3){
    Delimiter = arguments[3];
  }
  for(cnt=min;cnt lte max;cnt=cnt+1){
    if (cnt eq 1){
      outstring=""&cnt;
    }
    else{
      outstring=""&outstring&","&cnt;
    }
  }
  return outstring;
}
</cfscript>