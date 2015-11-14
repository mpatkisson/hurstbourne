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
 * Returns a relative path from the current template to an absolute file path.
 * v2 fix by Tony Monast
 * v2.1 fix by Tony Monast to deal with situations in which the specified path was the same as the current path, resulting in an error
 * 
 * @param abspath 	 Absolute path. (Required)
 * @return Returns a string. 
 * @author Isaac Dealey (info@turnkey.to) 
 * @version 2, August 30, 2012 
 */
function getRelative(abspath) {
        var currentPath = ListToArray(GetDirectoryFromPath(GetBaseTemplatePath()),"\/");
        var filePath = ListToArray(abspath,"\/");
        var relativePath = ArrayNew(1);
        var pathStart = 0;
        var i = 0;

        /* Define the starting path (path in common) */
        for (i = 1; i LTE ArrayLen(currentPath); i = i + 1) {

                if (currentPath[i] NEQ filePath[i]) {
                        pathStart = i;
                        break;
                }
        }

        if (pathStart GT 0) {
                /* Build the prefix for the relative path (../../etc.) */
                for (i = ArrayLen(currentPath) - pathStart ; i GTE 0 ; i = i - 1) {
                        ArrayAppend(relativePath,"..");
                }

                /* Build the relative path */
                for (i = pathStart; i LTE ArrayLen(filePath) ; i = i + 1) {
                        ArrayAppend(relativePath,filePath[i]);
                }
        }

        /* Same level */
        else
                ArrayAppend(relativePath,filePath[ArrayLen(filePath)]);

        /* Return the relative path */
        return ArrayToList(relativePath,"/");
}
</cfscript>