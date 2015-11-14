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
 * Creates UUIDs safe for use in MSSQL UNIQUEIDENTIFIER fields.
 * 
 * @param format 	 UUID format to generate.  Options are String or Binary. (Optional)
 * @return Returns a string. 
 * @author Chip Temm (chip@anthrologik.net) 
 * @version 1, June 27, 2002 
 */
function MSSQL_createUUID(){
	var format = 'string';
	// uniqueidentifier wombat_createUUID([string FORMAT])
	//returns a UUID in the format specified.  
	//optional argument FORMAT defaults to string (MS-SQL uniqueidentifier safe)
	//accepts 'binary' or 'string'.  other values fail quietly to 'string'
	
	
	if(arraylen(Arguments)){
		if(arguments[1] eq 'binary' or arguments[1] eq 'string'){
			format = arguments[1];
		}
	}
	
	if(format eq 'string'){
		return Insert("-", CREATEuuid(), 23);
		/***   NOTE quoted usage is SQL statement:
		Insert into attribute (attributeID) values ('#wombat_createUUID()#')
		***/
	
	}else{//must be raw binary
		return '0x' & Replace(CREATEuuid(),'-','','All'); 
		/***   NOTE UN-quoted usage is SQL statement:
		Insert into attribute (attributeID) values (#wombat_createUUID('binary')#)
		Good for cases where the value maybe either NULL or a UUID
		(neither of which should be quoted)
		***/
	}
}
</cfscript>