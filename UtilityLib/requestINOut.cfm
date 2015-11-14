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
 * Normalize input structures (URL, FORM, FLASH) to a single Request.IN structure for ubiquitous name space programming.
 * V2 for BlueDragon Support
 * 
 * @param orderList 	 Order of scopes to normalize. Defaults to url, form, flash. (Optional)
 * @return Returns true on successful normalization. 
 * @author Joseph Flanigan (joseph@switch-box.org) 
 * @version 2, September 2, 2005 
 */
function requestInOut() {
                var orderList = "url,form,flash";
                var i = 0;

                // if request.IN does not exist, create it
                if(not isDefined("request.IN")) {request.IN = structNew();}
                if(not isDefined("request.OUT")) {request.OUT = structNew();}

                if(arrayLen(arguments) gte 1) orderList = arguments[1];

                for (i=1;i lte listLen(orderList); i = i+1){
                        switch( UCase(listGetAt(orderList,i))) {
                                case "URL": {
                                        structAppend(request.IN,URL); // add URL
                                        break;
                                }

                                case "FORM": {
                                        structAppend(request.IN,FORM); // add FORM
                                        break;
                                }

                                case "FLASH": {
                                        if (IsDefined("FLASH")) structAppend(Request.IN,FLASH); // add FLASH
                                        break;
                                }
                        } //end switch
                } // end for

                if(not structIsEmpty(request.IN)) {
                        request.IN.FIELDNAMES = ""; // make sure fieldnames exist and is empty
                        request.IN.FIELDNAMES = structKeyList(request.IN); // make list of fieldnames
                        // then remove FIELDNAMES itself as a fieldname
                        request.IN.FIELDNAMES = listDeleteAt(request.IN.FIELDNAMES, listFindNoCase(request.IN.FIELDNAMES,"FIELDNAMES"));
                        return TRUE; // function end, input normalized
                }
                else return FALSE; // function end, nothing to normalize

}
</cfscript>