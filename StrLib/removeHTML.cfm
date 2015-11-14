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
 * Removes All HTML from a string removing tags, script blocks, style blocks, and replacing special character code.
 * 
 * @param source 	 String to format. (Required)
 * @return Returns a string. 
 * @author Scott Bennett (scott@coldfusionguy.com) 
 * @version 1, November 14, 2007 
 */
function removeHTML(source){
	
	// Remove all spaces becuase browsers ignore them
	var result = ReReplace(trim(source), "[[:space:]]{2,}", " ","ALL");
	
	// Remove the header
	result = ReReplace(result, "<[[:space:]]*head.*?>.*?</head>","", "ALL");
	
	// remove all scripts
	result = ReReplace(result, "<[[:space:]]*script.*?>.*?</script>","", "ALL");
	
	// remove all styles
	result = ReReplace(result, "<[[:space:]]*style.*?>.*?</style>","", "ALL");
	
	// insert tabs in spaces of <td> tags
	result = ReReplace(result, "<[[:space:]]*td.*?>","	", "ALL");
	
	// insert line breaks in places of <BR> and <LI> tags
	result = ReReplace(result, "<[[:space:]]*br[[:space:]]*>",chr(13), "ALL");
	result = ReReplace(result, "<[[:space:]]*li[[:space:]]*>",chr(13), "ALL");
	
	// insert line paragraphs (double line breaks) in place
	// if <P>, <DIV> and <TR> tags
	result = ReReplace(result, "<[[:space:]]*div.*?>",chr(13), "ALL");
	result = ReReplace(result, "<[[:space:]]*tr.*?>",chr(13), "ALL");
	result = ReReplace(result, "<[[:space:]]*p.*?>",chr(13), "ALL");
	
	// Remove remaining tags like <a>, links, images,
	// comments etc - anything thats enclosed inside < >
	result = ReReplace(result, "<.*?>","", "ALL");
	
	// replace special characters:
	result = ReReplace(result, "&nbsp;"," ", "ALL");
	result = ReReplace(result, "&bull;"," * ", "ALL");    
	result = ReReplace(result, "&lsaquo;","<", "ALL");        
	result = ReReplace(result, "&rsaquo;",">", "ALL");        
	result = ReReplace(result, "&trade;","(tm)", "ALL");        
	result = ReReplace(result, "&frasl;","/", "ALL");        
	result = ReReplace(result, "&lt;","<", "ALL");        
	result = ReReplace(result, "&gt;",">", "ALL");        
	result = ReReplace(result, "&copy;","(c)", "ALL");        
	result = ReReplace(result, "&reg;","(r)", "ALL");    
	
	// Remove all others. More special character conversions
	// can be added above if needed
	result = ReReplace(result, "&(.{2,6});", "", "ALL");    
	
	// Thats it.
	return result;

}
</cfscript>