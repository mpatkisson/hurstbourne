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
 Sends a SQL Batch script and reports results.
 
 @param BathCode 	 Set of SQL statements. (Required)
 @param DSN 	 The Datasource. (Required)
 @param sSep 	 Separator. Defaults to GO. (Optional)
 @return Returns a struct. 
 @author Joseph Flanigan (joseph@switch-box.org) 
 @version 2, November 9, 2006 
--->
<cffunction name="SQLBatcher" access="public" returntype="string" hint="Runs a set of queries based on sql string" output="false">
	<cfargument name="BatchCode" type="string" required="yes">
	<cfargument name="theDSN" type="string" required="yes">
	<cfargument name="sSep" type="string" required="no" default="GO">
		
	<cfscript> 
	var CleanedBatchCode = ReReplaceNoCase(BatchCode, "--.*?\r", "", "all");// clean sql comments
	var arBatchBlocks = ArrayNew(1); // index of each block and it's SQL string
	var separator = REFindNoCase("#arguments.sSep#\r",CleanedBatchCode,1,1); // looks for separators
	var pos = separator.pos[1]; // 0 or position of first separator
	var oldpos = 1;
	var Batch = 0; // count of separator blocks
	var Block = ""; // Code block of SQL 
	var sSQL = ""; // string to be returned
	
	// make sure arguments have length
	if ( (Len(Trim(theDSN)) EQ 0) OR (Len(Trim(CleanedBatchCode)) EQ 0) ) {
		sSQL = "<<<ERROR>>> Invalid parameters";
		return sSQL; // if there is an error stop batcher and return to caller 
	}
		
	// if no separator blocks, just query on the one block
	if(not pos) arBatchBlocks[1] = CleanedBatchCode;
	// loop around the separator blocks to get the code block for each separator
	while(pos gt 0) {
		block = mid(CleanedBatchCode,oldpos,pos-oldpos);
		// only add a block if there are characters in it. 
		if (ReFind("[[:alnum:]]",block,1,"False")) arrayAppend(arBatchBlocks,block);
		oldpos = pos + separator.len[1];
		separator = REFindNoCase("#arguments.sSep#\r|$",CleanedBatchCode,oldpos+1,1);
		pos = separator.pos[1];
	}		
	</cfscript>
		
	<!--- build return string --->
	<cfsavecontent variable="sSQL">
	
	<cfoutput>#Chr(60)#cftransaction#Chr(62)##Chr(10)##Chr(10)#</cfoutput>
		<cfloop index="Batch" from="1" to="#ArrayLen(arBatchBlocks)#" step="1">
			<cfset Block = arBatchBlocks[Batch]>
			<cfif Len(Trim(Block))><cfoutput>#Chr(60)#cfquery name="q#BATCH#" datasource="#Arguments.theDSN#"#Chr(62)##Chr(10)##Trim(PreserveSingleQuotes(Block))##Chr(10)##Chr(60)#/cfquery#Chr(62)##Chr(10)##Chr(10)#</cfoutput></cfif> 
		</cfloop>
	<cfoutput>#Chr(60)#/cftransaction#Chr(62)#</cfoutput>
	</cfsavecontent>
		
	<cfreturn sSQL>
</cffunction>