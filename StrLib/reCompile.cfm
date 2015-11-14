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
 * Create a java.util.regex.Pattern in a CF-friendly way.
 * 
 * @param flags 	 List or an array of valid Java Regex pattern flags: 'CANON_EQ', 'CASE_INSENSITIVE', 'COMMENTS', 'DOTALL', 'LITERAL', 'MULTILINE', 'UNICODE_CASE', 'UNIX_LINES' (Optional)
 * @return Returns a Java object. 
 * @author Henry Ho (henryho167@gmail.com) 
 * @version 1, May 30, 2011 
 */
function reCompile(required String regex, flags) {
	var pattern = createObject("java","java.util.regex.Pattern");
		
	if (isNull(flags))
		local.compiled = pattern.compile(regex);
	else {
		if (isSimpleValue(flags))
			flags = listToArray(flags);
	
		var flagInt = 0;
			
		for (local.flagName in flags)
			flagInt += pattern[flagName];
			
		local.compiled = pattern.compile(regex, javacast("int", flagInt));
	}
		
	return local.compiled;
}
</cfscript>