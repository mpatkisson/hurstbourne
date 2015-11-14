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
 * Easily creates a state select dropdown/
 * 
 * @param formVar 	 Name of form field to create. (Required)
 * @param abbreviate 	 If true, abbreviations are used. (Required)
 * @param addCanada 	 If true, adds Canadian provicnes. (Required)
 * @param selectedVal 	 Specifies which value to pre-select. (Optional)
 * @param cssclass 	 CSS class to use in generated form field. (Optional)
 * @return Returns a string. 
 * @author Tony Felice (sites@breckcomm.com) 
 * @version 0, January 6, 2009 
 */
function writeStateSelect(formVar,abbreviate,addCanada){
	var abbrevList = "AL,AK,AZ,AR,CA,CO,CT,DE,DC,FL,GA,HI,ID,IL,IN,IA,KS,KY,LA,ME,MD,MA,MI,MN,MS,MO,MT,NE,NV,NH,NJ,NM,NY,NC,ND,OH,OK,OR,PA,RI,SC,SD,TN,TX,UT,VT,VA,WA,WV,WI,WY";
	var nameList = "Alabama,Alaska,Arizona,Arkansas,California,Colorado,Connecticut,Delaware,District of Columbia,Florida,Georgia,Hawaii,Idaho,Illinois,Indiana,Iowa,Kansas,Kentucky,Louisiana,Maine,Maryland,Massachusetts,Michigan,Minnesota,Mississippi,Missouri,Montana,Nebraska,Nevada,New Hampshire,New Jersey,New Mexico,New York,North Carolina,North Dakota,Ohio,Oklahoma,Oregon,Pennsylvania,Rhode Island,South Carolina,South Dakota,Tennessee,Texas,Utah,Vermont,Virginia,Washington,West Virginia,Wisconsin,Wyoming";
	var provCodeList = ",---,AB,BC,MB,NB,NL,NT,NS,NU,ON,PE,QC,SK,YT";
	var provList = ",-- CANADIAN PROVINCES --,Alberta,British Columbia,Manitoba,New Brunswick,Newfoundland and Labrador,Northwest Territories,Nova Scotia,Nunavut,Ontario,Prince Edward Island,Quebec,Saskatchewan,Yukon";
	var selectedVal = "";
	var cssclass="none";
	var stateSelect = "";
	if (ArrayLen(arguments) gt 3){
		selectedVal = arguments[4];
	}
	if(ArrayLen(arguments) gt 4){
		cssclass = arguments[5];
	}
	if(addCanada eq 1){
		abbrevList = abbrevList & provCodeList;
		nameList = nameList & provList;
	}
	stateSelect = "<select name=""" & formVar & """ class=""" & cssclass & """>";
	if(abbreviate){
		stateSelect = stateSelect & "<option value=""0""></option>";
	}else{
		stateSelect = stateSelect & "<option value=""0"">Select State" & iif(addCanada eq 1,DE(" or Province"),DE("")) & "</option>";
	}
	for(i = 1;i lte listLen(abbrevList);i=i+1){
		stateSelect = stateSelect & "<option value=""" & listGetAt(abbrevList,i) & """ " & iif(selectedVal eq listGetAt(abbrevList,i),DE("selected"),DE("")) & ">" & iif(abbreviate eq 1,DE(listGetAt(abbrevList,i)),DE(listGetAt(nameList,i)))  & "</option>";
	}
	stateSelect = stateSelect & "</select>";
	
	return stateSelect;
}
</cfscript>