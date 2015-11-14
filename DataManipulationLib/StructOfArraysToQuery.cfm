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
 * Converts a structure of arrays to a CF Query.
 * 
 * @param theStruct 	 The structure of arrays you want converted to a query. 
 * @return Returns a query object. 
 * @author Casey Broich (cab@pagex.com) 
 * @version 1, March 27, 2002 
 */
function StructOfArraysToQuery(thestruct){
   var fieldlist = structkeylist(thestruct);
   var numrows   = arraylen( thestruct[listfirst(fieldlist)] );
   var thequery  = querynew(fieldlist);
   var fieldname="";
   var thevalue="";
   var row=1;
   var col=1;
   for(row=1; row lte numrows; row = row + 1)
   {
      queryaddrow(thequery);
      for(col=1; col lte listlen(fieldlist); col = col + 1)
      {
	 fieldname = listgetat(fieldlist,col);
	 thevalue  = thestruct[fieldname][row];
	 querysetcell(thequery,fieldname,thevalue);
      }
   }
return(thequery); }
</cfscript>