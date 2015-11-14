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
 Returns the most popular words in a query column and their count.
 Version 2 mods by Raymond Camden
 
 @param qQuery 	 The query to inspect. (Required)
 @param targetCol 	 The column to inspect. (Required)
 @param returnCount 	 Number of top words to return. Defaults to 10. (Optional)
 @param ignoreWords 	 Words to ignore. Defaults to: I,me,the,and,if,but,not,as,a,an,for,of,this,on,to,is (Optional)
 @return Returns a query. 
 @author C. Hatton Humphrey (hat@guardian-web.com) 
 @version 2, August 12, 2005 
--->
<cffunction name="popularWords" returntype="query" output="No">
	<cfargument name="qQuery" type="query" required="true">
	<cfargument name="targetCol" type="string" required="true">
	<cfargument name="returnCount" type="numeric" required="false" default="10">
	<cfargument name="ignoreWords" type="string" required="false" default="I,me,the,and,if,but,not,as,a,an,for,of,this,on,to,is">

	<cfset var thisRow = "">
	<cfset var thisLine = "">
	<cfset var thisWord = "">
	<cfset var wordData = structNew()>
	<cfset var qFinalResults = "">
	
	<!--- Create a query to contain the results, prime it so that loops
	don't fail since we can't INSERT or UPDATE using QoQ --->
	<cfset var qResults = queryNew("word,times")>

	<!--- Begin the looping, go through the query to check --->
	<cfloop from="1" to="#arguments.qQuery.RecordCount#" index="thisRow">
		<!--- Ease of use; set a "nickname" for the current line --->
		<cfset thisLine = arguments.qQuery[targetcol][thisRow]>

 		<!--- Loop through the line treating it as a list --->
 		<cfloop list="#thisLine#" delimiters=" " index="thisWord">
   
			<!--- Test for the words that we need to ignore (include all one-letter words) --->
	 		<cfif not listFindNoCase(arguments.ignoreWords, thisWord) and len(trim(thisWord)) gt 1>
		  		<cfif not structKeyExists(wordData, thisWord)>
						<cfset wordData[thisWord] = 0>
				</cfif>
				<cfset wordData[thisWord] = wordData[thisWord] + 1>
			</cfif>

	   </cfloop>
	</cfloop>

	<cfloop item="thisWord" collection="#wordData#">
		<cfset queryAddRow(qResults)>
		<cfset querySetCell(qResults, "word", thisWord)>
		<cfset querySetCell(qResults, "times", wordData[thisWord])>
	</cfloop>
	
	<!--- We've built our query, now use QoQ to get the "top 10" by count --->
	<cfquery name="qFinalResults" dbtype="query" maxrows="#arguments.returnCount#">
	select word, times
	from qresults
	order by times desc
	</cfquery>
	
	<cfreturn qFinalResults>
</cffunction>