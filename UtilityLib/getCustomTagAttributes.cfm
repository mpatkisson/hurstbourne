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
 Get an array of the attributes used in the given custom tag file.
 
 @param filePath 	 Full path to the custom tag. (Required)
 @return Returns a struct. 
 @author Steve Bryant (steve@bryantwebconsulting.com) 
 @version 1, October 14, 2008 
--->
<cffunction name="getCustomTagAttributes" returntype="array" output="false">
	<cfargument name="FilePath" type="string" required="yes">
	
	<cfset var MyFile = "">
	<cfset var reDefault = "\bsetDefaultAtt\(\#chr(34)#[\w\d]*\#chr(34)#">
	<cfset var reDot = "\battributes\.[\w\d]*\b">
	<cfset var reBracket = "\battributes\[\#chr(34)#[\w\d]*\#chr(34)#\]">
	<cfset var aRawAttributes = ArrayNew(1)>
	<cfset var find = 0>
	<cfset var temp = "">
	<cfset var attlist = "">
	<cfset var i = 0>
	<cfset var aAttributes = 0>
	
	<cffile action="read" file="#arguments.FilePath#" variable="MyFile">
	
	<cfscript>
	//Find all attributes set by my own UDF
	find = ReFindNoCase(reDefault,MyFile,1,1);
	while ( find.pos[1] GT 0 ) {
		temp = Mid(MyFile,find.pos[1],find.len[1]);
		temp = ReplaceNoCase(temp,"setDefaultAtt(#chr(34)#","");
		temp = Left(temp,Len(temp)-1);
		ArrayAppend(aRawAttributes,temp);
		find = ReFindNoCase(reDefault,MyFile,find.pos[1]+find.len[1]+1,1);
	}
	
	//Find all attributes with dot syntax
	find = ReFindNoCase(reDot,MyFile,1,1);
	while ( find.pos[1] GT 0 ) {
		temp = Mid(MyFile,find.pos[1],find.len[1]);
		temp = ListRest(temp,".");
		ArrayAppend(aRawAttributes,temp);
		find = ReFindNoCase(reDot,MyFile,find.pos[1]+find.len[1]+1,1);
	}
	
	//Find all attributes with bracket syntax
	find = ReFindNoCase(reBracket,MyFile,1,1);
	while ( find.pos[1] GT 0 ) {
		temp = Mid(MyFile,find.pos[1],find.len[1]);
		temp = ReplaceNoCase(temp,"attributes[#chr(34)#","");
		temp = Left(temp,Len(temp)-2);
		ArrayAppend(aRawAttributes,temp);
		find = ReFindNoCase(reBracket,MyFile,find.pos[1]+find.len[1]+1,1);
	}
	
	//Loop through array and build list (to ensure no duplicate attributes)
	attlist = "";
	for (i=1; i LTE ArrayLen(aRawAttributes); i=i+1) {
		if ( NOT ListFindNoCase(attlist,aRawAttributes[i]) ) {
			attlist = ListAppend(attlist,aRawAttributes[i]);
		}
	}
	aAttributes = ListToArray(attlist);
	</cfscript>
	
	<cfreturn aAttributes>
</cffunction>