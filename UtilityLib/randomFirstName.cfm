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
 Returns a random first name.
 
 @return Returns a string. 
 @author Matt Casey (matt@digitalhappy.com) 
 @version 1, June 22, 2010 
--->
<cffunction name="randomFirstName" output="false" access="public" returntype="any" hint="">
	<cfset var names = "Adam,Ahmed,Alex,Ali,Amanda,Amy,Andrea,Andrew,Andy,Angela,Anna,Anne,Anthony,Antonio,Ashley,Barbara,Ben,Bill,Bob,Brian,Carlos,Carol,Chris,Christian,Christine,Cindy,Claudia,Dan,Daniel,Dave,David,Debbie,Elizabeth,Eric,Gary,George,Heather,Jack,James,Jason,Jean,Jeff,Jennifer,Jessica,Jim,Joe,John,Jonathan,Jose,Juan,Julie,Karen,Kelly,Kevin,Kim,Laura,Linda,Lisa,Luis,Marco,Maria,Marie,Mark,Martin,Mary,Matt,Matthew,Melissa,Michael,Michelle,Mike,Mohamed,Monica,Nancy,Nick,Nicole,Patricia,Patrick,Paul,Peter,Rachel,Richard,Robert,Ryan,Sam,Sandra,Sara,Sarah,Scott,Sharon,Stephanie,Stephen,Steve,Steven,Susan,Thomas,Tim,Tom,Tony,William" />
	<cfreturn listGetAt(names, randRange(1,100)) />
</cffunction>