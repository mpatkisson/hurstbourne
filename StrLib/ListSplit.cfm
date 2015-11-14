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
 A split function for lists, splitting the original list into lists of n array elements.
 Rewritten by Raymond Camden
 Output delimiter mod by Jules Gravinese (webveteran.com), December 2009
 
 @param inList 	 The list to split. (Required)
 @param numGet 	 Number of items per array element. (Required)
 @param inDelimiter 	 List delimiter. Defaults to a comma. (Optional)
 @param outDelimiter 	 Output list delimiter, defaults to comma (Optional)
 @return Returns an array of lists. 
 @author Ryan Thompson-Jewell (ryan@thompson-jewell.com) 
 @version 3, March 11, 2010 
--->
<cffunction name="listSplit" output="no" returnType="array" description="
	* A split function for lists, splitting the original list into lists of n array elements.
	* Rewritten by Raymond Camden
	* Output delimiter mod by Jules Gravinese (webveteran.com), December 2009
	*
	* @author  Ryan Thompson-Jewell (ryan@thompson-jewell.com)
	* @version 2, September 24, 2002
">
	<cfargument name="inList"       default=""  hint="The list to split">
	<cfargument name="numGet"       default="1" hint="Number of items per array alement">
	<cfargument name="inDelimiter"  default="," hint="Input delimiter">
	<cfargument name="outDelimiter" default="," hint="Output delimiter">

    <cfscript>
    var aResult=arraynew(1);

    if(numGet gte listLen(inList,inDelimiter)) {
        aResult[1] = inList;
        return aResult;
    }
    aResult[1] = "";
    while(listLen(inList,inDelimiter)) {
        aResult[arrayLen(aResult)] = listAppend(aResult[arrayLen(aResult)],listFirst(inList,inDelimiter), outDelimiter);
        inList = listRest(inList,inDelimiter);
        if(listLen(aResult[arrayLen(aresult)],outDelimiter) is numGet and len(inList)) aResult[arrayLen(aResult)+1] = "";
    }
    return aResult;
    </cfscript>
</cffunction>