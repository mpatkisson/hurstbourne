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
 This will return the CFML code for a given user-defined function.
 
 @param UDFunction 	 The UDF. (Required)
 @return Returns a string. 
 @author Paul Kenney (paul_kenney_77@yahoo.com) 
 @version 1, April 30, 2003 
--->
<cffunction name="getFunctionCode" returntype="string" output="false" hint="This function returns the CFML source code for a UDF.">
	<cfargument name="UDFunction" type="any" required="true" hint="This is a UDF."/>
	<!---  --->
	<cfset var EncryptedFileHeader = "Allaire Cold Fusion Template" & Chr(10) & "Header Size: New Version">
	<cfset var filename = "">
	<cfset var funcname = "">
	<cfset var filecontents = "">
	<cfset var results = StructNew()>
	<cfset var parts = StructNew()>
	<cfset var length = StructNew()>
	<cfset var startIndex = 1>
	<cfset var scriptIndex = 1>
	<cfset var counter = 0>
	<cfset var i = 0>
	<cfset var ret = "">
	
	<cfset results["start"] = StructNew()>
	<cfset results["end"] = StructNew()>
	<cfset results["funcname"] = StructNew()>
	<cfset results["cfscript"] = StructNew()>
	<cfset results["cfscript"]["start"] = StructNew()>
	<cfset results["cfscript"]["end"] = StructNew()>
	<cfset results["function"] = StructNew()>
	
	<cfset parts["opentag"] = "">
	<cfset parts["cfsript"] = "">
	
	<cfset length["file"] = 0>
	<cfset length["cfscript"] = 0>
	<cfset length["cffunction"] = 0>
	
	<cfif IsCustomFunction(Arguments.UDFunction)>
		<cfset filename = Arguments.UDFunction.PagePath>
		<cfset funcname = Arguments.UDFunction.Metadata.Name>
	
		<cfif FileExists(filename)>
			<cftry>
				<cffile action="read" file="#filename#" variable="filecontents"/>
							
				<cfif NOT Compare(Left(filecontents, 53), EncryptedFileHeader)>
				
					<!--- This is an encrypted template file.  Cannot read the code. --->
					<!--- Do nothing. --->
					
				<cfelse>
					<cfset length.file = Len(filecontents)>
					<cfset startIndex = 1>
				
					<!--- Search for the function in any <cffunction> tags (CFMX) --->		
					<cfloop condition="startIndex LT length.file">
						<cfset results.start = REFindNoCase("<" & "cffunction[^>]+>", filecontents, startIndex, true)>
						
						<cfif results.start.pos[1]>
							<cfset parts.opentag = Mid(filecontents, results.start.pos[1], results.start.len[1])>
							<cfset results.funcname = REFindNoCase("[ ]+name[ ]*=[ ]*""#funcname#""", parts.opentag, 1, true)>
							<cfset results.end = REFindNoCase("<" & "/cffunction>", filecontents, results.start.pos[1] + results.start.len[1], true)>
							
							<cfif results.funcname.pos[1]>
								<cfif results.end.pos[1]>
									<!--- Found the function. --->
									<cfset length.cffunction = results.end.pos[1] + results.end.len[1] - results.start.pos[1]>
									<cfset ret = Mid(filecontents, results.start.pos[1], length.cffunction)>
								<cfelse>
									<!--- Could not find the end tag. --->
								</cfif>
								<cfbreak/>
							<cfelse>
								<cfif results.end.pos[1]>
									<cfset startIndex = results.end.pos[1] + results.end.len[1]>
								<cfelse>
									<cfset startIndex = results.start.pos[1] + 1>
								</cfif>
							</cfif>
						<cfelse>
							<!--- Could not find a function that is written using <cffunction> --->
							<cfbreak/>
						</cfif>
					</cfloop>
					
					<!--- Search for the function in CF Script code (CF 5+). --->
					<cfif NOT Len(ret)>
						<cfset startIndex = 1>
						<cfset scriptIndex = 1>
						
						<!--- Iterate over all of the <cfscript> blocks in this file. --->
						<cfloop condition="startIndex LT length.file">
							<cfset results.cfscript.start = REFindNoCase("<cfscript>", filecontents, startIndex, true)>
							
							<cfif results.cfscript.start.pos[1]>
								<cfset results.cfscript.end = REFindNoCase("</cfscript>", filecontents, results.cfscript.start.pos[1] + results.cfscript.start.len[1], true)>
							
								<cfif results.cfscript.end.pos[1]>
									<cfset length.cfscript = results.cfscript.end.pos[1] + results.cfscript.end.len[1] - results.cfscript.start.pos[1]>
									<cfset parts.cfscript = Mid(filecontents, results.cfscript.start.pos[1], length.cfscript)>
								
									<!--- Iterate all the functoins in the current <cfscript> block. --->
									<cfset results.function = REFindNoCase("function[ ]+#funcname#[ ]*\([^\)]*\)", parts.cfscript, scriptIndex, true)>
									<cfif results.function.pos[1]>
										<cfset scriptIndex = Find("{", parts.cfscript, results.function.pos[1])> 
										<cfset counter = 0>
										<cfloop index="i" from="#scriptIndex#" to="#length.cfscript#">
											<cfset parts.char = Mid(parts.cfscript, i, 1)>
											<cfif ListFindNoCase("{,}", parts.char, ",")>
												<cfif NOT Compare(parts.char, "{")>
													<cfset counter = counter + 1>
												<cfelseif NOT Compare(parts.char, "}")>
													<cfset counter = counter - 1>
												</cfif>
											</cfif>
											<cfif counter IS 0>
												<cfset ret = Mid(parts.cfscript, results.function.pos[1], i - results.function.pos[1] + 1)>
												<cfbreak/>
											</cfif>
										</cfloop>
										<cfbreak/>
									<cfelse>
										<cfset startIndex = results.cfscript.end.pos[1] + results.cfscript.end.len[1]>
									</cfif>
								<cfelse>
									<!--- Could not find closing <cfscript> tag. --->
									<cfbreak/>
								</cfif>
							<cfelse>
								<!--- Could not find any <cfscript> blocks. --->
								<cfbreak/>
							</cfif>
						</cfloop>
						
					</cfif>
				</cfif>
				
				<cfcatch type="any">
					<!--- There was some error, so just return an empty string. --->
					<cfset ret = "">
				</cfcatch>
			</cftry>
		</cfif>
	</cfif>

	<cfreturn ret/>
</cffunction>