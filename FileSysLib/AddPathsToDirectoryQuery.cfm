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
 * Adds a &quot;FullPath&quot; column to provided directory query.
 * 
 * @param theQuery 	 The query returned from CFDIRECTORY (Required)
 * @param basePath 	 String containing the path to the directory used in the CFDIRECTORY call (Optional)
 * @return query 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, July 9, 2003 
 */
function addPathsToDirectoryQuery(theQuery, basePath) {
	var row = 0;
	var new_col_array = arrayNew(1);

	if (listFindNoCase(theQuery.columnList, "FullPath")) {
		for(row=1; row LTE theQuery.recordCount; row=row+1) {
			querySetCell(theQuery, "FullPath", basePath & theQuery.name[row], row);
		}
	} else {
		for(row=1; row LTE theQuery.recordCount; row=row+1) {
			new_col_array[row] = basePath & theQuery.name[row];
		}
		queryAddColumn(theQuery, "FullPath", new_col_array);
	}

	return theQuery;
}
</cfscript>