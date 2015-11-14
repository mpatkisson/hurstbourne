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
 * Caesar-cypher encryption that replaces each English letter with the one 13 places forward or back along the alphabet.
 * 
 * @param string 	 String you wish to rot13 encrypt. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, August 23, 2001 
 */
function rot13(string)
{
  var i=0;
  var j=0;
  var k=0;
  var out="";
  for (i=1; i LTE Len(String); i=i+1){
    j=Asc(Mid(string, i, 1));
    if(j GTE 65 AND j LTE 90){
      j=((J-52) MOD 26)+65;
    }
    else if(j GTE 97 AND j LTE 122){
      j=((j-84) MOD 26)+97;
    }
    out=out&Chr(j);
  }
  return out;
}
</cfscript>