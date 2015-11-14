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
 Converts an excel file to a structure of arrays
 Modded by Raymond Camden to fix incorrect col count
 added minor changes from Tony
 
 @param excelFile 	 Excel file to parse. (Required)
 @param returnType 	 Whether to return a query or a structure. Defaults to an empty string which means a query. (Optional)
 @return Returns a struct of arrays. 
 @author anthony petruzzi (tpetruzzi@gmail.com) 
 @version 2, May 19, 2011 
--->
<cffunction name="parseExcel" access="public" returntype="any" output="false">
       <cfargument name="excelFile" type="string" required="true">
       <cfargument name="returnType" type="string" required="false" default="">
       <cfset var loc = {}>
       <!--- structure to hold data retrieved --->
       <cfset loc.ret = {}>
       <!--- did we get headers yet --->
       <cfset loc.firstRow = true>
       <!--- create io stream for the excel file --->
       <cfset loc.io = CreateObject("java","java.io.FileInputStream").init(excelFile)>
       <!--- read the excel file --->
       <cfset loc.workbook = CreateObject("java","org.apache.poi.hssf.usermodel.HSSFWorkbook").init(loc.io)>
       <!--- get the first sheet of the workbook. zero indexed --->
       <cfset loc.workSheet = loc.workBook.getSheetAt(javacast("int", 0))>
       <!--- get the number of rows the sheet has. zero indexed --->
       <cfset loc.rows = loc.workSheet.getLastRowNum()>

       <cfif !loc.rows>
               <cfreturn loc.ret>
       </cfif>

       <!--- array to store data --->
       <cfset loc.data = []>
       <!--- loop through the rows and get the values. --->
       <cfloop from="0" to="#loc.rows#" index="loc.atrow">
               <!--- get the row --->
               <cfset loc.row = loc.workSheet.getRow(javacast("int", loc.atrow))>
               <!--- first check to see if first cell 1 is blank, if not process, if so move to next --->
               <cfset loc.checkCell = loc.row.getCell(0).getStringCellValue()>
               <!--- if the first cell isn't blank, proceed --->
               <cfif len(trim(loc.checkCell))>
                       <!--- the first row will tell us the number of columns to process --->
                       <cfif loc.firstRow>
                               <cfset loc.cols = loc.row.getLastCellNum() - 1>
                               <cfset loc.firstrow = false>
                       </cfif>
                       <cfset loc.values = []>
                       <!--- loop through the columns (cells) of the row and get the values --->
                       <cfloop from="0" to="#loc.cols#" index="loc.col">
                               <cfset loc.value = "">
                               <cfset loc.cellType = loc.row.getCell(javacast("int", loc.col))>
                               <cfif structkeyexists(loc, "celltype")>
                                       <cfif loc.cellType.getCellType() eq 0>
                                               <cfset loc.value = loc.cellType.getNumericCellValue()>
                                       <cfelse>
                                               <cfset loc.value = loc.cellType.getStringCellValue()>
                                       </cfif>
                               </cfif>
                               <cfset arrayappend(loc.values, loc.value)>
                       </cfloop>

                       <!--- store the data --->
                       <cfset arrayappend(loc.data, loc.values)>
               </cfif>
       </cfloop>

       <cfif !arraylen(loc.data)>
               <cfreturn loc.ret>
       </cfif>

       <!--- create a struct of arrays to return --->
       <cfset loc.numDown = arraylen(loc.data)>
       <cfset loc.numAcross = ++loc.cols>
       <cfloop from="1" to="#loc.numAcross#" index="loc.across">
               <cfloop from="1" to="#loc.numDown#" index="loc.down">
               <!--- header --->
               <cfif loc.down eq 1>
                       <cfset loc.key = loc.data[loc.down][loc.across]>
                       <cfset loc.ret[loc.key] = []>
               <cfelse>
                       <cfset arrayappend(loc.ret[loc.key], loc.data[loc.down][loc.across])>
               </cfif>
               </cfloop>
       </cfloop>

       <cfif arguments.returnType eq "query">
               <cfset loc.q = QueryNew("")>
               <cfloop collection="#loc.ret#" item="loc.i">
                       <cfset QueryAddColumn(loc.q, loc.i, "varchar", loc.ret[loc.i])>
               </cfloop>
               <cfset loc.ret = loc.q>
       </cfif>

       <cfreturn loc.ret>
</cffunction>