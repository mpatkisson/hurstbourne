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
 Given the fully-qualified path of a CFC, it renders the cfcexplorer.getcfcashtml() output to html, flahspaper, or PDF for printing as reference.
 
 @param cfcType 	 The CFC type. (Required)
 @param outputType 	 Can be html, flashpaper, or pdf. Defaults to flashpaper. (Optional)
 @return Returns either a string or binary data. 
 @author Jared Rypka-Hauer (jared@web-relevant.com) 
 @version 1, August 30, 2005 
--->
<cffunction name="cfcToPrinter" access="public" output="false"  returntype="any">
    <cfargument name="cfcType" type="string" required="true" />
    <cfargument name="outputType" type="string" required="false" default="flashPaper" />
    <cfset var myCfc = structNew()>
    <cfset var myExplorer =  createObject("component","CFIDE.componentutils.cfcexplorer")>
    <cfset var cfcDocument = "">
    <cfset var cfceData = "">

    <cfset myCfc.name = arguments.cfcType>
    <cfset myCfc.path = "/" & replace(myCfc.name,".","/","all") & ".cfc">

    <!--- Trap CFCExplorer's output --->
    <cfsavecontent  variable="cfceData">
        <cfoutput>#myExplorer.getcfcinhtml(myCfc.name,myCfc.path)#</cfoutput>
    </cfsavecontent>

    <!--- Clean up the HTML a bit... there's a lotta crap in that output  stream... --->
    <cfset cfceData = reReplace(cfceData,"\t*?\n","","all")>
    <cfset cfceData = reReplace(cfceData,"\s{2,}",chr(10),"all")>

    <!--- Switch up the output stream based on outputType argument --->
    <cfswitch expression="#arguments.outputType#">
        <cfcase value="html">
            <!--- Return tidied HTML for cfoutputting --->
            <cfreturn cfceData />
        </cfcase>
        <cfcase value="flashpaper,pdf">
            <!--- Return !! object !! (use cfcontent to set the right mime  type!!) --->
            <cfdocument fontembed="true" name="cfcDocument"  format="#arguments.outputType#">
                <cfoutput>#cfceData#</cfoutput>
            </cfdocument>
            <cfreturn cfcDocument />
        </cfcase>
    <cfdefaultcase>
        <cfthrow message="Invalid data for argument outputType:  #arguments.outputType#"
            detail="Your choices for outputType are pdf, flashpaper, or html." />
    </cfdefaultcase>
    </cfswitch>
</cffunction>