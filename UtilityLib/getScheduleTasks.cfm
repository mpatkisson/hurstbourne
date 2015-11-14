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
 * This function will return a query listing all the schedule task on a ColdFusion server without admin access.
 * 
 * @return Returns a query. 
 * @author Qasim Rasheed (qasimrasheed@hotmail.com) 
 * @version 1, February 24, 2005 
 */
function getScheduledTasks(){
	var i = "";
	var j = "";
	var retquery = "";
	var alltasks = createobject("java","coldfusion.server.ServiceFactory").getCronService().listall();
	if (arraylen(alltasks )) {
		retquery = querynew(structkeylist(alltasks[1]));
		queryaddrow(retquery, arraylen(alltasks));
		for (i=1; i lte arraylen(alltasks); i = i+1){
			for (j in alltasks[i])
				querysetcell(retquery, j, alltasks[i][j]);
		}
	}
	else retquery = querynew( 'nothing' );
	return retquery;
}
</cfscript>