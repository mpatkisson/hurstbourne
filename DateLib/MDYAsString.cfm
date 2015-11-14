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
 * Returns a date in long text format.
 * 
 * @param daytString 	 Date object to convert. (Required)
 * @return Returns a string. 
 * @author Larry Juncker (ljuncker@aljcompserv.com) 
 * @version 1, November 1, 2002 
 */
function MDYAsString(daytString) {
    var dayList="First,Second,Third,Fourth,Fifth,Sixth,Seventh,Eighth,Ninth,Tenth,Eleventh,Twelveth,Thirteenth,Fourteenth,Fifteenth,Sixteenth,Seventeenth,Eighteenth,Nineteenth,Twentieth,Twenty First,Twenty Second,Twenty Third,Twenty Fourth,Twenty Fifth,Twenty Sixth,Twenty Seventh,Twenty Eighth,Twenty Ninth,Thirtieth,Thirty First";
    var DayAsString = ListGetAt(dayList,Day(DaytString));
    var numTenList="Ten,Twenty,Thirty,Fourty,Fifty,Sixty,Seventy,Eighty,Ninety";
    var numList="One,Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten,Eleven,Twelve,Thirteen,Fourteen,Fifteen,Sixteen,Seventeen,Eighteen,Nineteen";
    var y1=mid(Year(DaytString),1,1);
    var y2=mid(Year(DaytString),2,1);
    var y3=mid(Year(DaytString),3,1);
    var y4=mid(Year(DaytString),4,1);
    var y2Str = '';
    var y3Str = '';
		
    if(y2 gt 0) y2Str = ListGetAt(numList,y2) & " Hundred";
    if(y3 gt 0) y3Str = ListGetAt(numTenList,y3);
				
    return "The " & DayAsString & " day of " & MonthAsString(Month(DaytString)) & ", in the year " & ListGetAt(numList,y1) & " Thousand "   & y2Str & " " &  " and " & y3Str & " " & ListGetAt(numList,y4);

}
</cfscript>