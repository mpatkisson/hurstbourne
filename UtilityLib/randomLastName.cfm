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

<!---
 Returns a random last name.
 
 @return Returns a string. 
 @author Matt Casey (matt@digitalhappy.com) 
 @version 1, June 18, 2010 
--->
<cffunction name="randomLastName" output="false" access="public" returntype="any" hint="">
	<cfset names = "Adams,Ahmed,Ali,Allen,Anderson,Bailey,Baker,Barker,Barnes,Begum,Bell,Bennett,Brown,Butler,Campbell,Carter,Chapman,Clark,Clarke,Collins,Cook,Cooper,Cox,Davies,Davis,Dixon,Edwards,Ellis,Evans,Fisher,Foster,Gray,Green,Griffiths,Hall,Harris,Harrison,Harvey,Hill,Holmes,Hughes,Hunt,Hussain,Jackson,James,Jenkins,Johnson,Jones,Kelly,Khan,King,Knight,Lee,Lewis,Lloyd,Marshall,Martin,Mason,Matthews,Miller,Mills,Mitchell,Moore,Morgan,Morris,Murphy,Owen,Palmer,Parker,Patel,Phillips,Powell,Price,Richards,Richardson,Roberts,Robinson,Rogers,Russell,Scott,Shaw,Simpson,Singh,Smith,Stevens,Taylor,Thomas,Thompson,Turner,Walker,Ward,Watson,Webb,White,Wilkinson,Williams,Wilson,Wood,Wright,Young" />	
	<cfreturn listGetAt(names, randRange(1,100)) />
</cffunction>