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
 * This function validates user permissions against required permissions using either Bit, List or custom validation.
 * 
 * @param mode 	 String, "bit" or "list" (Required)
 * @param requiredPermission 	 Permissions required for access. (Required)
 * @param userPermissions 	 Permissions of the user. (Required)
 * @param failureXFA 	 Fusebox XFA (Optional)
 * @return Returns a boolean. 
 * @author Rob Rusher (rob@robrusher.com) 
 * @version 1, October 15, 2002 
 */
function SecureMX(model, requiredPermission, userPermissions) {
	var permitted = false;
	// Switch to appropriate security model
	switch( model ) {
		// Bit Validation
		case "bit":
		{
			if ( BitAnd( userPermissions, requiredPermission ) ) {
				permitted = true;
			}
			break;
		}
		// List Validation
		case "list":
		{
			if ( ListFindNoCase( userPermissions, requiredPermission ) ) {
				permitted = true;
			}
			break;
		}
		// Define custom validation here
		default:
		{
			include( model & ".cfm" );
			permitted = true;
		}
	}
	
	// If not permitted and an Exit FuseAction is defined
	if ( NOT permitted and isDefined( "attributes.failureXFA" ) ) {
		location( "#request.self#?fuseaction=#attributes.failureXFA#", 1 );
	}
	
	return (permitted);
}
</cfscript>