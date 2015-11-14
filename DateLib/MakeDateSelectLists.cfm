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
 * Creates pulldowns for month, day and year.
 * 
 * @param NameList 	 A list specifying the names to use for the form fields created. (Required)
 * @param StartYear 	 The first year in the year drop down. (Required)
 * @param EndYear 	 The last year in the year drop down. (Required)
 * @param DefaultDate 	 The date the drop downs will default to. Default is now(). (Optional)
 * @param theDelim 	 Delimiter for NameList. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 21, 2002 
 */
function MakeDateSelectLists(NameList, StartYear, EndYear) {
	var out_string  = "";
	var i           = 1;
	var theDelim    = ",";
	var CR          = chr(13);
	var defaultDate = now();
	
	if(arrayLen(arguments) gte 4) defaultDate = arguments[4];
	if(ArrayLen(Arguments) GTE 5) theDelim = Arguments[5];

	// Month
	out_string = "<select name='#ListFirst(NameList, theDelim)#'>#CR#";
	for(i=1; i LTE 12; i=i+1){
		if(i EQ Month(DefaultDate)){
			out_string  = out_string & "<option value='#i#' selected>#MonthAsString(i)#</option>#CR#";
		} else {
			out_string  = out_string & "<option value='#i#'>#MonthAsString(i)#</option>#CR#";
		}
	}
	out_string = out_string & "</select>#CR##CR#";

	// Day
	out_string = out_string & "<select name='#ListGetAt(NameList, 2, theDelim)#'>#CR#";
	for(i=1; i LTE 31; i=i+1){
		if(i EQ Day(DefaultDate)){
			out_string  = out_string & "<option value='#i#' selected>#i#</option>#CR#";
		} else {
			out_string  = out_string & "<option value='#i#'>#i#</option>#CR#";
		}
	}
	out_string = out_string & "</select>#CR##CR#";

	// Year
	out_string = out_string & "<select name='#ListLast(NameList, theDelim)#'>#CR#";
	for(i = StartYear; i LTE EndYear; i=i+1){
		if(i EQ Year(DefaultDate)){
			out_string  = out_string & "<option value='#i#' selected>#i#</option>#CR#";
		} else {
			out_string  = out_string & "<option value='#i#'>#i#</option>#CR#";
		}
	}
	out_string = out_string & "</select>#CR##CR#";


	return out_string;
}
</cfscript>