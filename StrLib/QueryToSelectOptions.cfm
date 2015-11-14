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
 * Creates a list of select-field option tags from the provided query.
 * 
 * @param theQuery 	 The query to use. (Required)
 * @param ValueField 	 The field to use for the value of the drop downs. (Required)
 * @param DisplayField 	 The field to use for the display of the drop downs. Defaults to ValueField. (Optional)
 * @param Selected 	 The selected value. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function QueryToSelectOptions(theQuery, ValueField) {
	var out_string  = "";
	var row         = 1;
	var CR          = chr(13);
	var DisplayField = ValueField;
	var Selected    = "";
	
	if(ArrayLen(Arguments) gte 3) DisplayField = Arguments[3];
	
	if(ArrayLen(Arguments) GTE 4) Selected = Arguments[4];

	for(row=1; row LTE theQuery.recordCount; row=row+1){
		if ((Selected NEQ "") and (theQuery[DisplayField][row] EQ Selected)) {
			out_string  = out_string & "<option value=""#Replace(theQuery[ValueField][row], """", "&quot;", "ALL")#"" selected>#ReplaceList(theQuery[DisplayField][row], "<,>", "&lt;,&gt;")#</option>#CR#";
		} else {
			out_string  = out_string & "<option value=""#Replace(theQuery[ValueField][row], """", "&quot;", "ALL")#"">#ReplaceList(theQuery[DisplayField][row], "<,>", "&lt;,&gt;")#</option>#CR#";
		}
	}

	return out_string;
}
</cfscript>