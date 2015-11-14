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
 * Fixes a list by replacing null entries.
 * This is a modified version of the ListFix UDF 
 * written by Raymond Camden. It is significantly
 * faster when parsing larger strings with nulls.
 * Version 2 was by Patrick McElhaney (pmcelhaney@amcity.com)
 * 
 * @param list 	 The list to parse. (Required)
 * @param delimiter 	 The delimiter to use. Defaults to a comma. (Optional)
 * @param null 	 Null string to insert. Defaults to "NULL". (Optional)
 * @return Returns a list. 
 * @author Steven Van Gemert (svg2@placs.net) 
 * @version 3, July 31, 2004 
 */
function listFix(list) {
var delim = ",";
  var null = "NULL";
  var special_char_list      = "\,+,*,?,.,[,],^,$,(,),{,},|,-";
  var esc_special_char_list  = "\\,\+,\*,\?,\.,\[,\],\^,\$,\(,\),\{,\},\|,\-";
  var i = "";
       
  if(arrayLen(arguments) gt 1) delim = arguments[2];
  if(arrayLen(arguments) gt 2) null = arguments[3];

  if(findnocase(left(list, 1),delim)) list = null & list;
  if(findnocase(right(list,1),delim)) list = list & null;

  i = len(delim) - 1;
  while(i GTE 1){
	delim = mid(delim,1,i) & "_Separator_" & mid(delim,i+1,len(delim) - (i));
	i = i - 1;
  }

  delim = ReplaceList(delim, special_char_list, esc_special_char_list);
  delim = Replace(delim, "_Separator_", "|", "ALL");

  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
  list = rereplace(list, "(" & delim & ")(" & delim & ")", "\1" & null & "\2", "ALL");
	  
  return list;
}
</cfscript>