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
 Replaces cffile upload, handling security checks and providing better error handling.
 
 @param filefield 	 Form field containing the file. (Required)
 @param destination 	 Directory of the destination. (Required)
 @param allowedextensions 	 List of allowed extensions. See code for default. (Optional)
 @param nameconflict 	 Specifies how to handle name conflicts. Defaults to makeUniqe. (Optional)
 @param invalidExtensionMessage 	 Message used for invalid extensions. Defaults to: The uploaded file has an invalid extension. (Optional)
 @param tempDirectory 	 Temporary directory used for uploads. Defaults to getTempDirectory(). (Optional)
 @return Returns a struct. 
 @author David Hammond (dave@modernsignal.com) 
 @version 1, November 26, 2010 
--->
<cffunction name="uploadFile" hint="Replaces cffile upload, handling file extension checking and providing better error handling." output="false" returntype="struct">
	<cfargument name="FileField" required="true" type="string">
	<cfargument name="Destination" required="true" type="string">
	<cfargument name="AllowedExtensions" default="ai,asx,avi,bmp,csv,dat,doc,docx,fla,flv,gif,html,ico,jpeg,jpg,m4a,mov,mp3,mp4,mpa,mpg,mpp,pdf,png,pps,ppsx,ppt,pptx,ps,psd,qt,ra,ram,rar,rm,rtf,svg,swf,tif,txt,vcf,vsd,wav,wks,wma,wps,xls,xlsx,xml,zip" type="string">
	<cfargument name="NameConflict" default="MakeUnique" type="string">
	<cfargument name="InvalidExtensionMessage" default="The uploaded file has an invalid extension." type="string">
	<cfargument name="TempDirectory" default="#getTempDirectory()#">
	<cfset var tempPath = "">
	<cfset var serverPath = "">
	<cfset var file = "">
	<cfset var fileName = "">
	<cfset var baseFileName = "">
	<cfset var i = 0>
	<cfset var skip = false>
	
	<!--- Make sure the destination directory exists. --->
	<cfif Not DirectoryExists(destination)>
		<cfthrow type="InvalidDestination" message="Destination directory ""#HtmlEditFormat(destination)#"" does not exist.">
	</cfif>

	<!--- Upload to temp directory. --->
	<cffile action="upload" filefield="#Arguments.FileField#" destination="#Arguments.TempDirectory#" nameconflict="MakeUnique">
	<cfset tempPath = ListAppend(cffile.ServerDirectory, cffile.ServerFile, "\/")>

	<!--- Check file extension --->
	<cfif Not ListFindNoCase(Arguments.AllowedExtensions,cffile.clientFileExt)>
		<!--- Bad file extension.  Delete file. --->
		<cfif FileExists(tempPath)>
			<cffile action="Delete" file="#tempPath#">
		</cfif>
		<!--- Throw error --->
		<cfthrow type="InvalidExtension" message="#Arguments.InvalidExtensionMessage#">
	</cfif>
	
	<!--- Replace bad characters in file name --->
	<cfset fileName = REReplaceNoCase(cffile.clientFileName,"[^\w_-]","","ALL")>
	<cfset file = fileName & "." & cffile.ClientFileExt>
	<cfset serverPath = ListAppend(destination, file, "\/")>
	
	<cfif FileExists(serverPath)>
		<!--- Handle name conflict --->
		<cfswitch expression="#Arguments.NameConflict#">
			<cfcase value="MakeUnique">
				<!--- Remove number if it exists --->
				<cfset baseFileName = REReplace(fileName,"_[\d]+$","")>
				<!--- Find an unused filename --->
				<cfloop condition="FileExists(serverPath)">
					<cfset i = i + 1>
					<cfset fileName = baseFileName & "_" & i>
					<cfset file = fileName & "." & cffile.ClientFileExt>
					<cfset serverPath = ListAppend(destination, file, "\/")>
				</cfloop>
				<cfset cffile.FileWasRenamed = false>
			</cfcase>
			<cfcase value="Error">
				<cffile action="Delete" file="#tempPath#">
				<cfthrow type="FileExists" message="The file #serverPath# already exists.">
			</cfcase>
			<cfcase value="Skip">
				<cfset skip = true>
				<cffile action="Delete" file="#tempPath#">
				<cfset cffile.FileWasSaved = false>
			</cfcase>
			<cfcase value="Overwrite">
				<cffile action="Delete" file="#serverPath#">
				<cfset cffile.FileWasOverwritten = true>
			</cfcase>
		</cfswitch>
	</cfif>
	
	<cfif Not skip>
		<!--- Rename and move file to destination directory --->
		<cffile action="rename" source="#tempPath#" destination="#serverPath#">
		<cfset cffile.ServerFileName = file>
		<cfset cffile.ServerFile = file>
		<cfset cffile.ServerDirectory = destination>
	</cfif>
				
	<cfreturn cffile>
</cffunction>