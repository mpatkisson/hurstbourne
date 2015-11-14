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
 Sets the values for one or more columns in the specified query row.
 
 @param query 	 Query to manipulate. (Required)
 @param columnlist 	 List of columns to update. (Required)
 @param valuelist 	 Values for the new data. (Required)
 @param rownumber 	 Row number to modify. If not specified, row is added to end of query. (Optional)
 @param delimiter 	 Delimiter for columnlist and valuelist. Defaults to a comma. (Optional)
 @param trimElements 	 If true, trims all values. Defaults to true. (Optional)
 @return Returns void.. 
 @author Ell Cord (lunareclipse13@earthlink.net) 
 @version 1, October 18, 2005 
--->
<cffunction name="querySetRow" returntype="void" output="false">
	<cfargument name="query" type="query" required="true" />
	<cfargument name="columnList" type="string" required="true" />
	<cfargument name="valuesList" type="string" required="true" />
	<cfargument name="rowNumber" type="numeric" required="false" default="0" />
	<cfargument name="delimiter" type="string" required="false"  default="," />
	<cfargument name="trimElements" type="boolean" required="false"  default="true" />
	
	<cfset var i 	   	= 0>
	<cfset var col	   	= "">
	<cfset var value	= "">
	
	<cfif arguments.rowNumber gt 0 and arguments.rowNumber gt arguments.query.recordCount>
		<cfthrow type="InvalidArgument" message="Invalid rowNumber [#arguments.rowNumber#]. The specified query contains [#arguments.query.RecordCount#] records.">
	</cfif>	
	<cfif ListLen(arguments.columnList, arguments.delimiter) NEQ ListLen(arguments.valuesList, arguments.delimiter)>
		<cfthrow type="InvalidArgument" message="[columnList] and [valuesList] do not contain the same number of elements.">
	</cfif>	
	
	<cfscript>
		//by default, append new row to end of query
		if (val(arguments.rowNumber) lt 1) {
			QueryAddRow(arguments.query, 1);
			rowNumber = arguments.query.recordCount;
		}
		
		//set values for each column
		for (i = 1; i lte ListLen(arguments.columnList, arguments.delimiter); i = i + 1) {
			if (arguments.trimElements) {	
				col   = Trim(ListGetAt(arguments.columnList, i, arguments.delimiter));	
				value = Trim(ListGetAt(arguments.valuesList, i, arguments.delimiter));	
			}
			else {
				col   = ListGetAt(arguments.columnList, i, arguments.delimiter);	
				value = ListGetAt(arguments.valuesList, i, arguments.delimiter);	
			}
		    query[col][arguments.rowNumber] = value;
		}
	</cfscript>
</cffunction>