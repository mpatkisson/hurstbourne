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
 * Converts binary data to hexadecimal format.
 * 
 * @param bin 	 Binary data. (Required)
 * @return Returns a string. If an error occurs, returns 
 * @author Axel Glorieux (axel@misterbuzz.com) 
 * @version 1, June 28, 2002 
 */
function Bin2Hex (bin){
 var str64 = tobase64(bin);
 var result = "";
 var a = 0;
 var b = 0;
 var c = "";
 var x = "";
 var i = 1;
 if (isbinary(bin)) {
  for (i;i LTE len(str64);i=i+1){
   c = asc(mid(str64,i,1));
   if (c LT 47)x = 62;
   else if (c LT 48)x = 63;
   else if (c EQ 61)x = 0;
   else if (c LT 65)x = c+4;
   else if (c LT 97)x = c-65;
   else x = c-71;
   if (i mod 2){
    a = bitshln(x,6);
   }
   else {
    b = x;
    for (j=len(formatbasen(a+b,16));j LT 3;j=j+1){
     result = result & 0;
    }
    result = result & formatbasen(a+b,16);
    a = 0;
    b = 0;
    }
   }
   if (right(str64,2) IS "=="){
    result = left(result,len(result)-4);
   }
   else if (right(str64,1) IS "="){
    result = left(result,len(result)-2);
   }
  return result;
 }
 else {
  result = "Invalid binary data";
 }
}
</cfscript>