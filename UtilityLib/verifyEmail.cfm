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
 * Validate an email existence using an external web service.
 * v2 mods by Raymond Camden
 * 
 * @param emailAddress 	 Address to validate. (Required)
 * @return Returns a structure. 
 * @author Craig Kaminsky (imageaid@gmail.com) 
 * @version 3, July 15, 2009 
 */
function verifyEmail(emailAddress){
	// local variables
	var email_address = Trim( arguments.emailaddress );
	var results = StructNew();
	var validationResponse = "";
	var ws = "";
	// add the default keys and values for returned struct 
	results.wsdl = "http://www.webservicex.net/ValidateEmail.asmx?wsdl";
	results.attemptTime = Now();
	// setup the web service
	ws = createObject( "webservice", results.wsdl );
	// ensure, first, that we have a properly formatted email address
	if( IsValid( "email", email_address )) {
		// setup some exception handling just in case the Web Service is down, etc.
		try
		{
			validationResponse = ws.IsValidEmail( Email=email_address );
		}
		catch( Any err )
		{
			results.emailResult = false;
			results.message = "Web Service response error: " + err.Message;
			results.resultCode = "fail";
			// exit the function and return the results struct
			return results;
		}			
		// check the response from the web service
		if( Ucase(Trim( validationResponse )) is "YES" )
		{
			results.emailResult = true;
			results.message = "Email address passed validation and verification.";
			results.resultCode = "valid";
		}
		else
		{
			results.emailResult = false;
			results.message = "Email address passed validation but failed verification.";
			results.resultCode = "invalid";
		}
	}
	else
	{
		results.emailResult = false;
		results.message = "Email address failed validation. It is not properly formatted.";
		results.resultCode = "invalid";
	}
	return results;
}
</cfscript>