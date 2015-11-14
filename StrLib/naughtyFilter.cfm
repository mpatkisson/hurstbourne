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
 Replaces dirty words with pattern.
 
 @param body 	 String to check. (Required)
 @param replaceType 	 If ALL, all characters are replaced. If FL, only the middle characters are replaced. Defaults to ALL. (Optional)
 @param repeatValue 	 String to use for replacement when replaceType is FL. Defaults to * (Optional)
 @param naughtyList 	 Default list of curse words. (Optional)
 @param replaceString 	 Used for replacements when replaceType is ALL. (Optional)
 @return Returns a string. 
 @author Chris Wigginton (c_wigginton@yahoo.com) 
 @version 1, November 30, 2004 
--->
<cffunction name="naughtyFilter"  returntype="string" hint="Replaces unmentionables with gobbledegook">
	<cfargument name="body" type="string" required="yes" hint="Contains text to filter">
	<cfargument name="replaceType" default="all" hint="ALL - all characters, FL - only the middle bits are replaced">
	<cfargument name="repeatValue" default="*" hint="Character to repeat for replaced dirty characters">
	<cfargument name="naughtyList" default="mother fucker,cocksucker,shit,piss,fuck,cunt,tits" hint="George Carlin's original 7 dirty words, not in his original order, but the longest listed first">
	<cfargument name="replaceString" default="!@##$%^&*()!@##$%^&*()!@##$%^&*" hint="A replace string for ALL method, length must be at least as long as the longest dirty word">
	<cfset var naughtyWord = "">
	<cfset var replacement = "">

	<cfloop list="#Arguments.naughtyList#" index="naughtyWord" delimiters=",">
		<cfswitch expression="#UCase(Arguments.replaceType)#">
			<cfcase value="FL">
				<cfif Len(naughtyWord) GTE 3>
					<cfset replacement = Left(naughtyWord,1) & RepeatString(Arguments.repeatValue,Len(naughtyWord) - 2) & Right(naughtyWord,1)>
				<cfelse>
					<cfset replacement = RepeatString(Arguments.repeatValue,Len(naughtyWord))>
				</cfif>	
			</cfcase>
			<cfdefaultcase>
					<cfset replacement = Left(Arguments.replaceString,Len(naughtyWord))>
			</cfdefaultcase>

		</cfswitch>
		<cfset Arguments.body = REReplaceNoCase(Arguments.body,naughtyWord,replacement, "ALL")>
	</cfloop>
	<cfreturn Arguments.body>
</cffunction>