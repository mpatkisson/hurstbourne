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
 Works with SolrClean UDF to UCASE Solr Keywords.
 
 @param string 	 String to run against (Required)
 @return Returns a string. 
 @author Sami Hoda (sami@bytestopshere.com) 
 @version 1, August 5, 2011 
--->
<cffunction name="uCaseWordsForSolr" access="public" output="false" returntype="Any" >
	<cfargument name="string" type="string" default="" required="true" hint="String to run against" />
	<cfargument name="listOfWords" type="string" default="AND,OR,NOT,TO" required="false" hint="Comma-delim list of words to uCase" />

	<cfset var sLocal = StructNew() />

	<cfset sLocal.newString = lcase(arguments.string) /> <!--- lcase by default. mixed-case treated as case-sensitive by Solr --->
	<cfset sLocal.i = "" />

	<cfloop list="#arguments.listOfWords#" index="sLocal.i">

		<cfset sLocal.newString = reReplaceNoCase(sLocal.newString, "([^a-z])(#sLocal.i#)([^a-z])", "\1#ucase(sLocal.i)#\3", "all")/>

	</cfloop>

	<cfreturn sLocal.newString />
</cffunction>