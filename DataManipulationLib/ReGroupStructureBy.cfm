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
 * Pass an Array of structures and the name of a column that exists within each, and it will create a Grouped &quot;Structure of Array of Structures&quot;.
 * 
 * @param mydata 	 Structure to parse. (Optional)
 * @param col 	 Column to group by. (Required)
 * @return Returns a structure. 
 * @author Casey Broich (cab@pagex.com) 
 * @version 1, May 26, 2003 
 */
function ReGroupBy(mydata,col){
  var i = "";
  var sttemp = structnew();
  var thisValue = "";
  for (i=1; i LTE arraylen(mydata); i=i+1){
    thisValue = mydata[i][col];
    if (not structkeyexists(sttemp, thisValue)){
      sttemp[thisValue] = arraynew(1);
    }
    arrayappend(sttemp[thisValue] , mydata[i]);
  }
  return sttemp;
}
</cfscript>