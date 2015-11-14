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
 * Converts an RGB color value into a hexadecimal color value.
 * 
 * @param r 	 Red value triplet (0-255) 
 * @param g 	 Green value triplet (0-255) 
 * @param b 	 Blue value triplet (0-255) 
 * @return Returns a string. 
 * @author Eric Carlisle (ericc@nc.rr.com) 
 * @version 1, November 27, 2001 
 */
function RGBtoHex(r,g,b){
  Var hexColor="";
  Var hexPart = '';
  Var i=0;
	
  /* Loop through the Arguments array, containing the RGB triplets */
  for (i=1; i lte 3; i=i+1){
    /* Derive hex color part */
    hexPart = formatBaseN(Arguments[i],16);
		
    /* Pad with "0" if needed */
    if (len(hexPart) eq 1){
      hexPart = '0' & hexPart;	
    } 
		
    /* Add hex color part to hexadecimal color string */
    hexColor = hexColor & hexPart;
  }
  return hexColor;
}
</cfscript>