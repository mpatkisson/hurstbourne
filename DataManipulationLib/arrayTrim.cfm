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
 This method trims an array to the specified number of elements.
 
 @return Returns an array. 
 @author Tayo Akinmade (olusina@hotmail.com) 
 @version 1, January 31, 2012 
--->
<cffunction name="arrayTrim" access="public" returntype="array" output="false" hint="This method trims an array to the specified number of elements. Triming is from right to left by default">
	<cfargument name="aArray" type="array" required="true" hint="The array to be trimed">
	<cfargument name="iLength" type="numeric" required="true" hint="The length the array is to be trimmed to">
	<cfargument name="sTrimFrom" type="string" required="false" hint="Direction of the array trim. RIGHT->LEFT|R, LEFT-RIGHT|L" default="L">
	<cfscript>
		var stLocal							= structNew();

		stLocal.aTrimmedArray 				= arguments.aArray;										// set trimmed array
		stLocal.iLoopIteration				= arrayLen(stLocal.aTrimmedArray)-arguments.iLength; 	// get number of delete iterations

		// check if new length is less that the current length
		if(arguments.iLength lt  arrayLen(stLocal.aTrimmedArray)){
			for(stLocal.i = 1; stLocal.i lte stLocal.iLoopIteration;stLocal.i = stLocal.i + 1){
				// get index of array element to delete
				if(compareNoCase(arguments.sTrimFrom,"R") EQ 0){
					stLocal.iDeleteIindex	=  arrayLen(stLocal.aTrimmedArray);
				}
				else{
					stLocal.iDeleteIindex	= 1;
				}

				// delete array element
				arrayDeleteAt(stLocal.aTrimmedArray, stLocal.iDeleteIindex);
			}
		}

		return stLocal.aTrimmedArray;
	</cfscript>
</cffunction>