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
 * Pass in an optional UDF argument of a specific type and define a default value at once.
 * 
 * @param args 	 Arguments to check. (Required)
 * @param index 	 Index to check. (Required)
 * @param type 	 Type to use. (Required)
 * @param default 	 Value to use if args[index] doesn't exist. Defaults to an empty string if type isn't struct or array. (Optional)
 * @return Returns a value (any type). 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, August 20, 2002 
 */
function OptArgType( args, index, type ) {
	if( arrayLen( args ) GTE index AND typeOf( args[ index ] ) IS type ) {
		return args[ index ];
	} else if( arrayLen( arguments ) IS 4 ) {
		return arguments[ 4 ];
	} else {
		switch( type ) {
			case "structure" : return structNew();
			case "array" : return arrayNew( 1 );
			default : return "";
		}
	}
}
</cfscript>