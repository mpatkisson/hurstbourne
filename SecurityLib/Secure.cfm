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
 * This function validates user permissions against required permissions using Bit, List or custom validation.
 * 
 * @param model 	 String, "bit" or "list" (Required)
 * @param requiredPermission 	 Permissions required for access. (Required)
 * @param userPermissions 	 Permissions of the user. (Required)
 * @return Returns a boolean. 
 * @author Rob Rusher (rob@robrusher.com) 
 * @version 1, September 27, 2002 
 */
function Secure(model, requiredPermission, userPermissions) {
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
		default: {
			// Define custom validation here.
			permitted = true;
		}
	}
	
	return (permitted);
}
</cfscript>