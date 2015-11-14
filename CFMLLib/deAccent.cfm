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
 * Replaces accented characters with their non accented closest equivalents.
 * 
 * @return Returns a string. 
 * @author Rachel Lehman (raelehman@gmail.com) 
 * @version 1, November 15, 2010 
 */
function deAccent(str){
	var newstr = "";
    var list1 ="á,é,í,ó,ú,ý,à,è,ì,ò,ù,â,ê,î,ô,û,ã,ñ,õ,ä,ë,ï,ö,ü,ÿ,À,È,Ì,Ò,Ù,Á,É,Í,Ó,Ú,Ý,Â,Ê,Î,Ô,Û,Ã,Ñ,Õ,Ä,Ë,Ï,Ö,Ü,Ÿ";
    var list2 = "a,e,i,o,y,u,a,e,i,o,u,a,e,i,o,u,a,n,o,a,e,i,o,u,y,A,E,I,O,U,A,E,I,O,U,Y,A,E,I,O,U,A,N,O,A,E,I,O,U,Y";
    
    newstr = ReplaceList(str,list1,list2);
    return newstr;
}
</cfscript>