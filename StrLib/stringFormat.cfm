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
 * Formats a string similarly to how NumberFormat formats a number.
 * 
 * @param str 	 String to format. (Required)
 * @param msk 	 Mask to use. (Required)
 * @return Returns a string. 
 * @author Joshua Miller (jmiller@garrisonenterprises.net) 
 * @version 1, August 10, 2007 
 */
function stringFormat(str,msk){
	var i=0;
	var c=1;
	var r="";
	for(i=1;i LTE Len(msk);i=i+1){
		if(Find("X",mid(msk,i,1)) GT 0){
			if(c LTE Len(str)){
				r = r & mid(str,c,1);
				c = c + 1;
			}else{
				r = r & " ";
			}
		}else{
			r = r & mid(msk,i,1);
		}
	}
	return r;
}
</cfscript>