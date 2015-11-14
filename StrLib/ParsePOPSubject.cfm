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
 * Parses subjects returned by CFPOP.
 * 
 * @param subject 	 Subject string to parse. (Required)
 * @return Returns a structure. 
 * @author Axel Glorieux (axel@misterbuzz.com) 
 * @version 1, September 27, 2002 
 */
function parsepopsubject(subj){
	var re = "=\?([^?]+)\?([BbQq])\?([^?]+)\?=";
	var re2 ="=([[:xdigit:]]{2})";
	var tmp = refind(re,subj,1,true);
	var obj = structnew();
	var type = "";
	var start = 1;
	var eos = false;
	var tmp2 = "";
	var newch = "";
	if (arraylen(tmp.pos) NEQ 4){
		obj.subject = subj;
		obj.encoding = "";
		return obj;
	}
	obj.encoding = mid(subj,tmp.pos[2],tmp.len[2]);
	obj.subject = mid(subj,tmp.pos[4],tmp.len[4]);
	type = mid(subj,tmp.pos[3],tmp.len[3]);
	switch (type){
		case "b":{
			obj.subject = tostring(tobinary(obj.subject));
			break;
		}
		case "q":{
			while (NOT eos){
				obj.subject = replace(obj.subject,"_"," ","ALL");
				tmp2 = refind(re2,obj.subject,start,true);
				if (tmp2.pos[1]){
					newch = chr(inputbasen(mid(obj.subject,tmp2.pos[2],tmp2.len[2]),16));
					obj.subject = removechars(obj.subject,tmp2.pos[1],tmp2.len[1]);
					obj.subject = insert(newch,obj.subject,tmp2.pos[1]-1);
					start = tmp2.pos[2];
				}
				else {
					eos = true;
				}
			}
			break;
		}
	}
	return obj;
}
</cfscript>