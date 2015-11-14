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
 Returns an array of weekdays.
 
 @param startdate 	 Starting date. Defaults to 8/23/2007. (Required)
 @param enddate 	 Ending date. Defaults to 9/6/2007. (Required)
 @return Returns a two-dimensional array. 
 @author Mike Nadasy (mikenadasy@comcast.net) 
 @version 1, April 10, 2008 
--->
<cffunction name="GetWeekdays" returntype="array" output="false">
	<cfargument  name="startDate" default="2007/08/23">
	<cfargument name="endDate" default="2007/09/06">	
	<cfscript>
		//Total number of days to display
		var numOfDays = DateDiff("d",arguments.startDate,arguments.endDate) +2;
		
		//Array to hold text and value fields for select options
		var dateArray = arraynew(2);
		var i = "";
		
		//Populate array with date information
		for(i=1;i lt numOfDays; i=i+1)
		{
			if(arguments.startdate lte enddate)
			{
				dateArray[i][1] = dateformat(arguments.startdate,"yyyy/mm/dd");
				switch(dayofweek(arguments.startdate))
				{
					case 2:
					{
						dateArray[i][2] = "Mon, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					case 3:
					{
						dateArray[i][2] = "Tues, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					case 4:
					{
						dateArray[i][2] = "Wed, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					case 5:
					{
						dateArray[i][2] = "Thur, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					case 6:
					{
						dateArray[i][2] = "Fri, " &  dateformat(dateArray[i][1],"mmm d, yyyy");
						break;
					}
					default:
					{
						dateArray[i][2] = "Empty";
						break;
					}
				}	
				arguments.startdate = dateadd("d",1,arguments.startdate);				
			}
		}	
		
		//Clean out array of "Empty" cells
		for(i=1; i lt arraylen(dateArray); i=i+1)
		{
			if(dateArray[i][2] eq "Empty")
			{
				ArrayDeleteAt(dateArray,i);//Saturday
				ArrayDeleteAt(dateArray,i);//Sunday
			}		
		}			
	</cfscript>
	<cfreturn dateArray>
</cffunction>