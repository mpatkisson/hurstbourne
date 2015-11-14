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
 * Returns true if the given color is a web safe hexadecimal color.
 * 
 * @param hexColor 	 Hex color representation to validate. 
 * @return Returns a Boolean value. 
 * @author Eric Carlisle (ericc@nc.rr.com) 
 * @version 1, November 6, 2001 
 */
function IsWebSafeColor(hexColor){
  /* Establish list of web safe colors */
  Var safeList = "00,33,66,99,cc,ff";
	
  /* Strip out poundsigns from argument. */
  Var tHexColor = replace(hexColor,'##','','ALL');

  /* Initialize i */
  Var i=0;
  
  /* Loop over r,g,b hex values */
  for (i=1; i lte 5; i=i+2){
		
    /* Set result to FALSE if a color isn't web safe. */	
    if (listFindNoCase(safeList,mid(tHexColor,i,2)) eq 0){
      return False;
    }
  }
  return True;
}
</cfscript>