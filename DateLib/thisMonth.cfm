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
 * Returns structure containing month information.
 * 
 * @param current_date 	 The date to use. Defaults to now(). (Optional)
 * @return Returns a structure. 
 * @author Ian Winter (ianwinter@gmail.com) 
 * @version 1, July 25, 2005 
 */
function thisMonth() {
	var returnStruct = structNew();
	var current_date = now();
	var letterList="st,nd,rd,th";
	var domLetters="";
	var i = "";
	var thisDate = "";
	var thisKey = "";
	var domStr = "";
	
	if (arrayLen(arguments)) current_date = arguments[1];
	
	returnStruct.monthBegin = CreateDate(Year(current_date),Month(current_date),01);
	returnStruct.monthEnd = CreateDate(Year(current_date),Month(current_date),DaysInMonth(current_date));
	returnStruct.monthNumber = Month(current_date);
	returnStruct.monthDays = DaysInMonth(current_date);
	
	for(i=1; i LTE returnStruct.monthDays ; i=i+1) {
		thisDate = CreateDate(Year(current_date),Month(current_date),i);
		thisKey = dateAdd("d",i-1,returnStruct.monthBegin);
		domStr = DateFormat(thisDate,"d");
		switch (domStr) {
			case "1": case "21": case "31":  domLetters=ListGetAt(letterList,'1'); break;
			case "2": case "22": domLetters=ListGetAt(letterList,'2'); break;
			case "3": case "23": domLetters=ListGetAt(letterList,'3'); break;
			default: domLetters=ListGetAt(letterList,'4');
		}
		StructInsert(returnStruct,i,StructNew());
		StructInsert(returnStruct[i],"dayAsString",DayOfWeekAsString(DayOfWeek(thisDate)));
		StructInsert(returnStruct[i],"date",thisKey);
		StructInsert(returnStruct[i],"dateLetters",domLetters);
	}
	
	return returnStruct;

}
</cfscript>