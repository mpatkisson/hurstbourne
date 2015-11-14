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
 * returns a list of tags for a module in CVS based on passed in rlog results.
 * 
 * @param rlog 	 RLog results from CVS. (Required)
 * @return Returns a string. 
 * @author Douglas Knudsen (doug@cubicleman.com) 
 * @version 1, October 14, 2008 
 */
function getTagListFromRLOG( rlog )	{
		var myrlog = replace(arguments.rlog,'=============================================================================',chr(236),'All');
		var myArray = ListToArray(myrlog,chr(236));
		var myLength = ArrayLen(myArray);
		var startStr = 'symbolic names:';
		var endStr = 'keyword substitution:';
		var startPos = 0;
		var myLen = 0;
		var HDList = '';
		var i = '';
		var j = '';
		var tag = '';
		var hdArray = '';
		var hdArrayLen = 0;
	
		for(i=1; i LTE myLength; i = i +1)	{
			startPos = Find(startStr,myArray[i])+Len(startStr);
			myLen = Find(endStr,myArray[i]) - Find(startStr,myArray[i]) - Len(endStr);
			if( myLen GT 0 )	{
				hdArray = ListToArray(myArray[i],':');
				hdArrayLen = ArrayLen(hdArray);
				for(j=1; j LTE hdArrayLen; j = j + 1)	{
					if( Find('HD',hdArray[j]) )	{
						tag = Mid(hdArray[j],Find('HD',hdArray[j]), Len(hdArray[j]));
						if(NOT ListContains(HDList,tag,',') )
							HDList = ListAppend(HDList,tag);
					}
				
				}
			
			}
		
		}
		return HDList;
	}
</cfscript>