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
 Replaces all special characters in a string of text.
 
 @param textString 	 String to have special characters replaced (Required)
 @param replaceTheseChars 	 Characters to be replaced (Optional)
 @param replaceWithChar 	 Character to replace special characters with. Defaults to chr(0). (Optional)
 @return Returns a string. 
 @author David Long (dlong@cagedata.com) 
 @version 1, January 4, 2012 
--->
<cffunction name="replaceSpecialChars" access="public" output="false" returntype="String">
	<cfargument name="textString" type="String" hint="String to have special characters replaced">
	<!--- If you would not like to remove spaces take the number 32 out of the list.--->
	<cfargument name="replaceTheseChars" type="String" default="32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,58,59,60,61,62,63,64,91,92,93,94,95,96,123,124,126" required="false" hint="Characters to be replaced">
	<cfargument name="replaceWithChar" type="String" default="#chr(0)#" required="no" hint="Character to replace special characters with.">
	<cfscript>
		var returnString = ARGUMENTS.textString;
		var i = 1;
		
		for(i=1; i <= listLen(ARGUMENTS.replaceTheseChars,','); i++){
			returnString = replace(returnString,chr(listGetAt(ARGUMENTS.replaceTheseChars,i)),ARGUMENTS.replaceWithChar,'all');
		}
	</cfscript>
	
	<cfreturn returnString />
</cffunction>