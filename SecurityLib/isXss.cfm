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
 Checks against all the possible combinations of the character &quot;&lt;&quot; in HTML and JavaScript (in UTF-8) and returns a boolean value based on the result.
 
 @param field 	 String to check. (Required)
 @return Returns a boolean. 
 @author MIchael Bramwell (mbramwell@gmail.com) 
 @version 1, February 22, 2011 
--->
<cffunction name="isXss" hint="" access="public" returntype="boolean">
	<cfargument name="field" type="string" required="yes" />
	
	<cfset var bReturn = false />
	<cfset var encodingsOfLessThan = "<
%3C
&lt
&lt;
&LT
&LT;
&##
&##60
&##060
&##0060
&##00060
&##000060
&##0000060
&##60;
&##060;
&##0060;
&##00060;
&##000060;	
&##0000060;
&##x3c
&##x03c
&##x003c
&##x0003c
&##x00003c
&##x000003c
&##x3c;
&##x03c;
&##x003c;
&##x0003c;
&##x00003c;
&##x000003c;
&##X3c
&##X03c
&##X003c
&##X0003c
&##X00003c
&##X000003c
&##X3c;
&##X03c;
&##X003c;
&##X0003c;
&##X00003c;
&##X000003c;
&##x3C
&##x03C
&##x003C
&##x0003C
&##x00003C
&##x000003C
&##x3C;
&##x03C;
&##x003C;
&##x0003C;
&##x00003C;
&##x000003C;
&##X3C
&##X03C
&##X003C
&##X0003C
&##X00003C
&##X000003C
&##X3C;
&##X03C;
&##X003C;
&##X0003C;
&##X00003C;
&##X000003C;
\x3c
\x3C
\u003c
\u003C">
	
	<cfloop list="#encodingsOfLessThan#" index="i" delimiters="#chr(10)#">
		
		<cfif Find(i, arguments.field)>
			<cfset bReturn = true >
		</cfif>
	</cfloop>
	
	<cfreturn bReturn />
	
</cffunction>