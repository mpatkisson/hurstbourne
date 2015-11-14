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
 * Convert a hexadecimal color into a RGB color value.
 * 
 * @param hexColor 	 6 character hexadecimal color value. 
 * @return Returns a string. 
 * @author Eric Carlisle (ericc@nc.rr.com) 
 * @version 1.0, November 6, 2001 
 */
function HexToRGB(hexColor){
  /* Strip out poundsigns. */
  Var tHexColor = replace(hexColor,'##','','ALL');
	
  /* Establish vairable for RGB color. */
  Var RGBlist='';
  Var RGPpart='';	

  /* Initialize i */
  Var i=0;

  /* Loop through each hex triplet */
  for (i=1; i lte 5; i=i+2){
    RGBpart = InputBaseN(mid(tHexColor,i,2),16);
    RGBlist = listAppend(RGBlist,RGBpart);
  }
  return RGBlist;
}
</cfscript>