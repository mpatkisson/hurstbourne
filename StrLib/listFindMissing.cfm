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
 * Find missing integers in a list of consequential numbers.
 * 
 * @param list 	 List to check. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 * @version 1, July 20, 2005 
 */
function listFindMissing(list) {
  var delim=","; // list delimiter
  var arrToSearch=""; 
  var i=0;
  var j=0;    
  var returnList="";
  if(arrayLen(arguments) GTE 2) delim = arguments[2];
  arrToSearch=listToArray(list,delim);
  for(i=ArrayMin(arrToSearch);i LTE arrayMax(arrToSearch);i=i+1)
    for(j=1;j LTE arrayLen(arrToSearch);j=j+1) 
      if(arrToSearch[j] EQ i)  break;
      else 
        if (j EQ arrayLen(arrToSearch))
          returnList = listAppend(returnList,i,delim);
  return returnList;
}
</cfscript>