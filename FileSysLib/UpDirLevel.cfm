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
 * Climbs up a given UNC Path a specified number of levels.
 * 
 * @param currDir 	 The directory to use as a starting point from which to climb. (Required)
 * @param upCt 	 Integer specifying the number of directory levels to move up. (Required)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function upDirLevel(currDir,upCt){
	var i=1;
	var currDirTemp=Reverse(currDir);
	var s=0;
	for(i=1;i LTE upCt;i=i+1){
		s=findoneof("\/",currDirTemp,1);
		if(s EQ 1){
			currDirTemp=Right(currDirTemp,val(Len(currDirTemp)-s));
			s=find("\",currDirTemp,1);
			currDirTemp=Right(currDirTemp,val(Len(currDirTemp)-s));
		}else{
			currDirTemp=Right(currDirTemp,val(Len(currDirTemp)-s));
		}
	}
	currDirTemp="#reverse(replacenocase(currDirTemp,'/','\','ALL'))#\";
	return currDirTemp;
}
</cfscript>