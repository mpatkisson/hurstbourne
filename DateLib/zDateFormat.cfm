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
 Formats the given date as a Zulu date.
 
 @param offset 	 Offset from GMT. (Required)
 @param date 	 The date to format. (Required)
 @return Returns a string. 
 @author Jeffrey Pratt (quicquid@gmail.com) 
 @version 1, August 23, 2005 
--->
<cffunction name="zDateFormat" returntype="string">
	<cfargument name="offset" type="string" required="true"/>
	<cfargument name="date" type="date" required="true"/>
	
	<cfset var sign = Left(offset, 1)/>
	<cfset var hours = Mid(offset, 2, 2)/>
	<cfset var minutes = Mid(offset, 4, 2)/>
	<cfset var zDate = "">
	<cfset var formattedDate = "">
	
	<cfif not IsNumeric(offset) or len(offset) neq 5 or (sign is not "-" and sign is not "+")>
		<cfthrow type="InvalidGMTOffsetFormatException" message="A valid GMT offset is of the form '-hhmm' or '+hhmm', with 'hh' being the number of hours and 'mm' being the number of minutes by which the date is offset from GMT."/>
	</cfif>
	
	<cfif sign Is "+">
		<cfset hours = -hours/>
		<cfset minutes = -minutes/>
	</cfif>
	
	<cfset zDate = dateAdd("n", minutes, dateAdd("h", hours, date))/>
	<cfset formattedDate = dateFormat(zDate, "yyyy-mm-dd") & "T" & timeFormat(zDate, "HH:mm:ss") & "Z"/>
	
	<cfreturn formattedDate/>
</cffunction>