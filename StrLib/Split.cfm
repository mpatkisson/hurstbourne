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
 * Splits a string according to another string or multiple delimiters.
 * 
 * @param str 	 String to split. (Required)
 * @param splitstr 	 String to split on. Defaults to a comma. (Optional)
 * @param treatsplitstrasstr 	 If false, splitstr is treated as multiple delimiters, not one string. (Optional)
 * @return Returns an array. 
 * @author Steven Van Gemert (svg2@placs.net) 
 * @version 3, February 12, 2005 
 */
function split(str) {
	var results = arrayNew(1);
	var splitstr = ",";
	var treatsplitstrasstr = true;
	var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
	var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";	
	var regex = ",";
	var test = "";
	var pos = 0;
	var oldpos = 1;

	if(ArrayLen(arguments) GTE 2){
		splitstr = arguments[2]; //If a split string was passed, then use it.
	}
	
	regex = ReplaceList(splitstr, special_char_list, esc_special_char_list);
	
	if(ArrayLen(arguments) GTE 3 and isboolean(arguments[3])){
		treatsplitstrasstr = arguments[3]; //If a split string method was passed, then use it.
		if(not treatsplitstrasstr){
			pos = len(splitstr) - 1;
			while(pos GTE 1){
				splitstr = mid(splitstr,1,pos) & "_Separator_" & mid(splitstr,pos+1,len(splitstr) - (pos));
				pos = pos - 1;
			}
			splitstr = ReplaceList(splitstr, special_char_list, esc_special_char_list);
			splitstr = Replace(splitstr, "_Separator_", "|", "ALL");
			regex = splitstr;
		}
	}
	test = REFind(regex,str,1,1);
	pos = test.pos[1];

	if(not pos){
		arrayAppend(results,str);
		return results;
	}

	while(pos gt 0) {
		arrayAppend(results,mid(str,oldpos,pos-oldpos));
		oldpos = pos+test.len[1];
		test = REFind(regex,str,oldpos,1);
		pos = test.pos[1];
	}
	//Thanks to Thomas Muck
	if(len(str) gte oldpos) arrayappend(results,right(str,len(str)-oldpos + 1));

	if(len(str) lt oldpos) arrayappend(results,"");

	return results;
}
</cfscript>