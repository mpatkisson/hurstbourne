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
 * Will replace chars in a string to be used to create a folder with valid equivalent replacements
 * 
 * @param folder 	 Name of folder. (Required)
 * @return Returns a string. 
 * @author Mike Gillespie (mike@striking.com) 
 * @version 1, May 9, 2003 
 */
function foldercheck(folder) {
   var bad_chars="?,/,\,*,&,%,$,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?";
   var good_chars="A,-,-,-,-,-,-,A,A,A,A,A,A,C,D,E,E,E,E,I,I,I,I,N,O,O,O,O,O,U,U,U,U,Y,a,a,a,a,a,a,a,c,e,e,e,o,e,i,i,i,i,n,o,o,o,o,o,u,u,u,u,y,y,i";
   var scrubbed="";

   if(folder eq "") return "";
   return replace(replace(ReplaceList(trim(folder), bad_chars, good_chars)," ","_","all"),"'","","all");
}
</cfscript>