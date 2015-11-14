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
 * Performs venn type operations on two lists.
 * 
 * @param listA 	 The first list. (Required)
 * @param listB 	 The second list. (Required)
 * @param returnListType 	 Return list type. Values can be: AandB, AorB, AnotB, BnotA  (Required)
 * @param listADelimiter 	 List A delimiter. Defaults to a comma. (Optional)
 * @param listBDelimiter 	 List B delimiter. Defaults to a comma. (Optional)
 * @param returnListDelimiter 	 Return list delimiter. Defaults to a comma. (Optional)
 * @return Returns a list. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, February 14, 2006 
 */
function listVenn(ListA,ListB,ReturnListType){
	var i					= "";
	var ThisListItem		= "";
	var ListADelimeter		= ",";
	var ListBDelimeter		= ",";
	var ReturnListDelimeter	= ",";
	var ReturnList			= "";
	var TempListA			= ListA;
	var TempListB			= ListB;
	
	
	// Handle optional arguments
	switch(ArrayLen(arguments)) {
		case 4:
		{
			ListADelimeter	= Arguments[4];
			break;
		}
		case 5:
		{
			ListADelimeter		= Arguments[4];
			ListBDelimeter		= Arguments[5];        
			break;
		}       
		case 6:
		{
			ListADelimeter		= Arguments[4];
			ListBDelimeter		= Arguments[5];        
			ReturnListDelimeter = Arguments[6];
			break;
		}
 		}
	// change delimeters on both lists to match
	// couldn't get listchangedelims to work, otherwise I'd have used that.
	ListA = "";
	ListB = "";
	for (i = 1; i lte listlen(TempListA,ListADelimeter); i = i + 1){
		ThisListItem = listgetat(TempListA,i,ListADelimeter);
		ListA = ListAppend(ListA,ThisListItem,ReturnListDelimeter);
	}
	for (i = 1; i lte listlen(TempListB,ListBDelimeter); i = i + 1){
		ThisListItem = listgetat(TempListB,i,ListBDelimeter);
		ListB = ListAppend(ListB,ThisListItem,ReturnListDelimeter);
	}

	// A and B (aka Intersection)
	if (ReturnListType eq "AandB"){
		for(i = 1; i lte listlen(ListA,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListA,i,ReturnListDelimeter);
			if (ListFindNoCase(ListB,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	// A or B (aka Union)
	else if(ReturnListType eq "AorB"){
		ReturnList = ListA;
		ReturnList = ListAppend(ReturnList,ListB,ReturnListDelimeter);
		
	}
	// A not B
	else if (ReturnListType eq "AnotB"){
		for(i = 1; i lte listlen(ListA,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListA,i,ReturnListDelimeter);
			if (not ListFindNoCase(ListB,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	// B not A
	else if (ReturnListType eq "BnotA"){
		for(i = 1; i lte listlen(ListB,ReturnListDelimeter); i = i + 1){
			ThisListItem = listgetat(ListB,i,ReturnListDelimeter);
			if (not ListFindNoCase(ListA,thisListItem,ReturnListDelimeter)){
				ReturnList = ListAppend(ReturnList,ThisListItem,ReturnListDelimeter);
			}
		}
	}
	return ReturnList;
}
</cfscript>