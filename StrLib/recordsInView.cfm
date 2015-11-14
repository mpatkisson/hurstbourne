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
 * Creates an easy reccord pagination indicator.
 * 
 * @param rowsPerPage 	 Number of rows per page. (Required)
 * @param currentPage 	 Current page. (Required)
 * @param recordCount 	 Total number of rows. (Required)
 * @return Returns a string. 
 * @author Tony Felice (sites@breckcomm.com) 
 * @version 0, January 20, 2009 
 */
function recordsInView(rowsPerPage,currentPage,recordCount){
	var first = "";
	var last = "";
	var output = "";
	if(currentPage eq 1){
		first = 1;
	}else{
		first = rowsPerPage*(currentPage - 1)+1;
	}
	if(rowsPerPage - ((currentPage*rowsPerPage) - recordCount) gt rowsPerPage){
		last = currentPage*rowsPerPage;
	}else{
		last = recordCount;
	}		
	
	if(first lt last){
		output = first & " to " & last & " of " & recordCount;
	}else if (first eq recordCount){
		output = first & " of " & recordCount;
	}else if (first gt recordCount){
		output = recordCount & " of " & recordCount;
	}
	return output;
}
</cfscript>