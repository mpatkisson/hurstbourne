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
 * Function to translate Macromedia's XML Resource Feed into ColdFusion variables.
 * 
 * @param s 	 variable containing the contents of the Macromedia XML feed.  Usually CFHTTP.FileContent (Required)
 * @return Returns an array of structures. 
 * @author Jeffry Houser (jeff@farcryfly.com) 
 * @version 2, August 12, 2002 
 */
function TranslateMacromediaResourceFeed(S) {

	// the current token we are looking at 
	var Token = GetToken(S,1,"<>");
	
	// LoopControl needs to be initialized
	var LoopControl = 1;
	
	// Initialize the Current Query Row 
	var RowNumber = 1;

	// the number of the next token we are looking at 
	var NextToken = 2;
	
	var ResourceStruct = StructNew();

	// Initialize Return Query 
	var ResultQuery = QueryNew("Type, Title, Author, URL, ProductName");
	
	// loop until we are out of tokens 
	while(Token is not "/macromedia_resources"){
	
		switch(Left(Token,7)){

			case "resourc":{
				// if we are getting a resource token, we want to:
				// create a new blank structure 
				// and define the structure's type
				
				// define new structure
				ResourceStruct = StructNew();
				
				// add the type of entry to the structure
				StructInsert(ResourceStruct, "Type", GetToken(Token,  2, """"));

				// increment next token
				NextToken = NextToken + 1;
				break;
			} // end resource case			
			
			case "/resour":{
				// if we are getting a /resource token, we want to:
				// Create a new row in the query for each product 
				// Assuming the structure isn't empty 
				
				// copy existing structure into result array
				if (not StructIsEmpty(ResourceStruct)){
					
					for (LoopControl = 1 ; 
						 LoopControl LTE ArrayLen(ResourceStruct.Products) ; 
						 LoopControl = LoopControl+1){
						
						// add a new row to the query 
						RowNumber = QueryAddRow(ResultQuery);
						
						// populate Query 
						QuerySetCell(ResultQuery, "Type", ResourceStruct.Type, RowNumber);
						QuerySetCell(ResultQuery, "Title", ResourceStruct.Title, RowNumber);
						QuerySetCell(ResultQuery, "Author", ResourceStruct.Author, RowNumber);
						QuerySetCell(ResultQuery, "URL", ResourceStruct.URL, RowNumber);
						QuerySetCell(ResultQuery, "ProductName", ResourceStruct.Products[LoopControl], RowNumber);

					}
					
				}
				
				// increment next token
				NextToken = NextToken + 1;
				break;
			} // end resource case			


			case "title":{
				// if we are getting the title token, then we want to:
				// add the next token to our structure, because that will be our title text
				// increment the 'nexttoken' variable two increments past the end title token

				// add the title to the structure
				StructInsert(ResourceStruct, "Title", GetToken(S,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 2;

				break;
			} // end title case

			case "author":{
				// if we are getting the author token, then we want to:
				// add the next token to our structure, because that will be our author text
				// increment the 'nexttoken' variable two increments past the end Author token

				// add the title to the structure
				StructInsert(ResourceStruct, "Author", GetToken(S,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 2;
				
				break;
			} // end author case 


			case "url":{
				// if we are getting the url token, then we want to:
				// add the next token to our structure, because that will be our url text
				// increment the 'nexttoken' variable two increments past the end url token

				// add the title to the structure
				StructInsert(ResourceStruct, "URL", GetToken(S,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 2;
				
				break;
			} // end url case 
			
			case "product":{ 
				// if the case is a product, we want to:
				// Pick out the name from the token and add it to our product array
				// increment the nexttoken variable once
				
				// if product array doesn't exist, create it
				if (not IsDefined("ResourceStruct.Products")){
					StructInsert(ResourceStruct, "Products", ArrayNew(1));
				}
				
				// add product name to array 
				ArrayAppend(ResourceStruct.Products,GetToken(Token,  2, """"));
				
				// increment next token
				NextToken = NextToken + 1;
				
				break;
			} // end product case 

			
//				case "/title","/author","/url"
//				these cases or anything else not defined, we just ignore, but we still wanna get the 
// 			next token
			default: {
				Token = GetToken(S,NextToken,"<>");
				NextToken = NextToken + 1;
				break;
			} // end default case 
		} // end switch
		Token = GetToken(S,NextToken,"<>");
	} // end while

	return (ResultQuery);
}
</cfscript>